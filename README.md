# 🇨🇴 Salva a Colombia con el Tigre y JoseManuel 🇨🇴

Juego de arcade tipo **Galaga** hecho con HTML, CSS y JavaScript puro (sin
dependencias). Controlas a **Abelardo de la Espriella** y debes derribar a los
personajes del **Parto Histérico** antes de que aterricen.

## ▶️ Jugar en línea

**👉 https://nithioso.github.io/Galaga1/**

(También puedes abrir `index.html` localmente; ver la sección *Publicar*.)

## 🎮 Cómo jugar

1. Entra al **enlace de arriba** (o abre `index.html` en un navegador moderno).
2. Escribe tu **nombre** y pulsa **EMPEZAR**.
3. Destruye a los enemigos y sobrevive el mayor número de niveles posible.

### Controles

| Plataforma | Mover | Disparar | Pausa | Sonido |
|------------|-------|----------|-------|--------|
| 💻 **PC**  | ⬅️ ➡️ (flechas) | `Espacio` o clic | `P` / `Esc` o botón ⏸ | botón 🔊 |
| 📱 **Móvil** | Desliza el dedo | Automático al tocar | Botón ⏸ | botón 🔊 |

## ✨ Características

- **Nombre del jugador:** se solicita al iniciar cada partida (se recuerda el
  último usado).
- **Jefes finales y "mundos":** cada **5 niveles** aparece un líder gigante con
  barra de vida que se mueve y lanza ráfagas (se enfurece con poca vida). Al
  derrotarlo **ganas un mundo**: salen **tigres** 🐯 y el lema
  **"Firmes por la patria 🫡"**, sueltas un power-up y ganas muchos puntos.
- **Final del juego:** al derrotar al **último villano (Gustavo Petro)** ganas y
  aparece la **pantalla de victoria** con el mensaje de campaña y la imagen de
  **Abelardo y José Manuel** (vota la X el 21 de junio 🇨🇴).
- **Arma mejorable + power-ups:** empiezas con **arma nivel 2** y la subes hasta
  **nivel 5** recogiendo **⬆** (más disparos a la vez). Otros power-ups:
  **⚡ disparo rápido**, **🛡️ escudo** temporal y **♥ vida extra**.
- **Música, efectos y voz:** banda sonora procedimental, efectos de sonido,
  **fanfarria de victoria** y una **voz** que grita el lema al ganar un mundo
  (si el navegador lo soporta). Botón 🔊 para silenciar (preferencia recordada).
- **Detalles:** cada protagonista dispara de un **color distinto** (Abelardo
  dorado, Restrepo azul), contador de **Mundo** en el HUD, y favicon de
  **tigre con la bandera de Colombia** 🐯🇨🇴.
- **Récord universal:** ranking en línea **compartido entre todos los
  jugadores** (mejor puntaje por persona + mundos conquistados). Ver la sección
  *Récord universal* para activarlo. Además se guarda un **Top 5 local** en el
  navegador.
- **Inicio amable:** empiezas con **5 vidas**, **arma nivel 2** y un **escudo de
  cortesía**; en los primeros niveles los enemigos casi no disparan y no se
  lanzan en picada (las picadas empiezan en el nivel 3). La dificultad sube de
  forma gradual nivel a nivel.
- **Optimizado para móvil:** lienzo responsivo y nítido (se adapta a la densidad
  de píxeles del dispositivo), control táctil con disparo automático, pausa
  automática al cambiar de pestaña y soporte para zonas seguras (notch).
- **Identidad visual colombiana:** el título lleva la **bandera de Colombia**
  (con sus proporciones reales) y el protagonista viste la **camiseta de la
  Selección Colombia** (amarilla, con cuello tricolor y el número 10).
- **Distintivo de villano:** cada enemigo lleva una insignia de **calavera** que
  los marca como antagonistas.
- **Fotos reales automáticas:** al abrir el juego, el navegador descarga la
  **foto real** de cada personaje desde **Wikipedia** y la usa como sprite. Si
  no hay conexión, se dibuja la ilustración de respaldo. También puedes colocar
  tus propias fotos en [`assets/`](assets/README.md) para anular las de
  Wikipedia. *(Las fotos provienen de Wikipedia/Wikimedia Commons y pertenecen
  a sus respectivos autores y licencias.)*
- **Personajes** (ilustraciones en `<canvas>` con sombreado, o tus fotos):
  - 🛡️ **Jugadores (se alternan por mundo):** Abelardo de la Espriella y
    José Manuel Restrepo.
  - 🎯 **Jefes (con apodo satírico, un jefe por mundo):** Barbie Sarabia,
    El Guionista Bolívar, La Doctora Guerrero, El Voltearepas Barreras,
    Helicóptero Márquez, El Camaleón Benedetti, La Cacica Quilcué,
    La Heredera Pizarro, **El Camarada Cepeda** (penúltimo) y
    **El Mesías Petro** (jefe final). *(Las fotos se buscan por el nombre real.)*

## 🗂️ Estructura

Todo el juego está contenido en un único archivo:

```
index.html   →  HTML + CSS + JavaScript (juego completo)
```

El código está comentado en español y organizado por secciones: estado del
juego, dibujo de caras, entidades, entrada (teclado/táctil), bucle principal,
pausa, colisiones, dibujado e interfaz.

## 🚀 Publicar

Este repositorio ya está publicado con **GitHub Pages** (Settings → Pages →
*Deploy from a branch* → `main` / `root`), disponible en
**https://nithioso.github.io/Galaga1/**. Cada cambio en `main` se publica solo.

Al ser un solo archivo estático, también puedes abrirlo localmente o publicarlo
en cualquier hosting estático (Netlify, Vercel, etc.) sin compilación.

> 💡 Para que las **fotos reales** se carguen sin problemas, conviene servir el
> juego por **http(s)** (GitHub Pages o un servidor local como
> `python3 -m http.server`). Algunos navegadores bloquean peticiones de red al
> abrir el archivo directamente con `file://`; en ese caso se verán las
> ilustraciones de respaldo.

## 🌐 Récord universal (Supabase)

El **récord universal** está activo con **Supabase**: al terminar cada partida
el puntaje se envía a una base de datos compartida y se muestra el **🌐 Top 15
global** (mejor puntaje por jugador + mundos conquistados).

Seguridad del marcador:

- La clave `anon` incrustada es **pública por diseño**; la protección la da la
  **RLS** del servidor: los jugadores solo pueden **leer** e **insertar**
  puntajes que cumplen validación (nombre ≤ 14, score y worlds en rango). **No
  se permite editar ni borrar** (no hay policies de UPDATE/DELETE).
- El cliente además **sanea** todo lo que recibe (enteros acotados + escape de
  texto), por lo que un dato malicioso en la base no puede inyectar nada.

Si no hay conexión, el juego sigue funcionando con el **Top 5 local**.

## ✍️ Autor

Creado con amoor por la patria por [@NiThiOso](https://x.com/NiThiOso) 🐯🇨🇴
