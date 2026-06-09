-- ============================================================================
--  SalvaAcolombia — Esquema y BLINDAJE del récord universal (Supabase/Postgres)
-- ----------------------------------------------------------------------------
--  Cómo aplicarlo:
--    1) Entra a tu proyecto en https://supabase.com  →  SQL Editor.
--    2) Pega TODO este archivo y pulsa "Run".
--  Es idempotente: se puede ejecutar varias veces sin romper nada.
--
--  Qué protege:
--    • RLS activado: el rol público (anon) SOLO puede LEER e INSERTAR.
--      No hay políticas de UPDATE ni DELETE → nadie puede editar/borrar.
--    • CHECK constraints: rechazan en el servidor cualquier valor fuera de
--      rango (nombre 1..14, score 0..1e9, worlds 0..9999), aunque alguien
--      llame a la API directamente saltándose el cliente.
--    • Límite de tasa por trigger: frena inundaciones (máx. N inserciones por
--      minuto en toda la tabla) sin bloquear el juego normal.
-- ============================================================================

-- 1) Tabla -------------------------------------------------------------------
create table if not exists public.scores (
  id         bigint generated always as identity primary key,
  name       text        not null,
  score      bigint      not null,
  worlds     integer     not null default 0,
  created_at timestamptz not null default now()
);

-- 2) Restricciones de validez (defensa en el servidor) -----------------------
--    Se añaden solo si no existen, para que el script sea repetible.
do $$
begin
  if not exists (select 1 from pg_constraint where conname = 'scores_name_len') then
    alter table public.scores
      add constraint scores_name_len
      check (char_length(name) between 1 and 14);
  end if;

  if not exists (select 1 from pg_constraint where conname = 'scores_score_range') then
    alter table public.scores
      add constraint scores_score_range
      check (score >= 0 and score <= 1000000000);   -- tope = 1e9 (igual que el cliente)
  end if;

  if not exists (select 1 from pg_constraint where conname = 'scores_worlds_range') then
    alter table public.scores
      add constraint scores_worlds_range
      check (worlds >= 0 and worlds <= 9999);
  end if;
end $$;

-- Índice para ordenar/leer el Top rápido
create index if not exists scores_score_desc on public.scores (score desc);

-- 3) Seguridad a nivel de fila (RLS) -----------------------------------------
alter table public.scores enable row level security;

-- Lectura pública (el ranking es visible para todos)
drop policy if exists "scores_select_public" on public.scores;
create policy "scores_select_public"
  on public.scores for select
  to anon, authenticated
  using (true);

-- Inserción pública, pero SOLO si cumple validación (defensa en profundidad).
-- Nota: las CHECK constraints ya validan; el WITH CHECK lo refuerza a nivel de
-- política, así un payload inválido se rechaza incluso antes de tocar la tabla.
drop policy if exists "scores_insert_valid" on public.scores;
create policy "scores_insert_valid"
  on public.scores for insert
  to anon, authenticated
  with check (
    char_length(name) between 1 and 14
    and score  >= 0 and score  <= 1000000000
    and worlds >= 0 and worlds <= 9999
  );

-- ¡OJO! NO se crean políticas de UPDATE ni DELETE a propósito: con RLS activo,
-- la ausencia de política = operación denegada para todos los roles públicos.

-- 4) Límite de tasa anti-inundación ------------------------------------------
--    Rechaza inserciones si en el último minuto ya hubo demasiadas en toda la
--    tabla. Ajusta el umbral a tu gusto (por defecto 60/min ≈ 1 por segundo).
create or replace function public.scores_rate_limit()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
declare
  recent_count integer;
  max_per_min  integer := 60;   -- súbelo o bájalo según tu tráfico
begin
  select count(*) into recent_count
    from public.scores
   where created_at > now() - interval '1 minute';

  if recent_count >= max_per_min then
    raise exception 'rate limit exceeded: too many scores per minute';
  end if;

  return new;
end $$;

drop trigger if exists scores_rate_limit_trg on public.scores;
create trigger scores_rate_limit_trg
  before insert on public.scores
  for each row execute function public.scores_rate_limit();

-- ============================================================================
--  Opcional (más estricto): límite por dirección IP usando una Edge Function.
--  Postgres por sí solo no conoce la IP del cliente anónimo, así que si quieres
--  un rate-limit por IP, crea una Edge Function que reciba el insert, lea la IP
--  de la cabecera y aplique el límite antes de escribir. Para la mayoría de
--  casos, las CHECK constraints + el límite global de arriba son suficientes.
-- ============================================================================
