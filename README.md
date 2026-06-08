# 🇨🇴 SalvaAcolombia

Juego de arcade tipo **Galaga** hecho con HTML, CSS y JavaScript puro (sin
dependencias). Controlas a **Abelardo de la Espriella** y debes derribar a los
personajes del **Pacto Histórico** antes de que aterricen.

## ▶️ Jugar en línea

**👉 https://gringoinc.github.io/Galaga1/**

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
- **Jefes finales:** cada **5 niveles** aparece un líder gigante con barra de
  vida que se mueve y lanza ráfagas de disparos. Al derrotarlo sueltas un
  power-up y ganas muchos puntos.
- **Power-ups:** caen al destruir enemigos —
  **x2** (disparo doble), **🛡️ escudo** temporal y **♥ vida extra**.
- **Música y efectos:** banda sonora procedimental y efectos de sonido, con
  botón 🔊 para silenciar (se recuerda tu preferencia).
- **Top 5 local:** se guarda en el navegador con `localStorage` y se muestra al
  terminar, resaltando tu posición. Incluye botón para borrarlo.
- **Marcador global opcional:** ranking en línea compartido entre jugadores
  (ver sección *Marcador global*).
- **Dificultad progresiva y amable al inicio:** el **nivel 1 es suave** (los
  enemigos casi no disparan y no se lanzan en picada) y empiezas con **disparo
  doble** y un **escudo de cortesía**. La dificultad sube nivel a nivel.
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
  - 🛡️ **Jugador:** Abelardo de la Espriella
  - 🎯 **Enemigos:** Gustavo Petro, Iván Cepeda, Francia Márquez, Roy Barreras,
    Gustavo Bolívar, Armando Benedetti, Aída Quilcué, María José Pizarro,
    Laura Sarabia y Juliana Guerrero.

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
**https://gringoinc.github.io/Galaga1/**. Cada cambio en `main` se publica solo.

Al ser un solo archivo estático, también puedes abrirlo localmente o publicarlo
en cualquier hosting estático (Netlify, Vercel, etc.) sin compilación.

> 💡 Para que las **fotos reales** se carguen sin problemas, conviene servir el
> juego por **http(s)** (GitHub Pages o un servidor local como
> `python3 -m http.server`). Algunos navegadores bloquean peticiones de red al
> abrir el archivo directamente con `file://`; en ese caso se verán las
> ilustraciones de respaldo.

## 🌐 Marcador global (opcional)

El juego ya guarda tu **Top 5 local**. Para activar además un **ranking en
línea compartido** entre todos los jugadores (Top 10 global), solo necesitas un
"bin" JSON gratuito:

1. Entra a **https://jsonblob.com**, borra el contenido y escribe `[]`, y pulsa
   *Save*.
2. Copia la **URL de la API** (algo como
   `https://jsonblob.com/api/jsonBlob/XXXXXXXXXXXX`).
3. En `index.html`, pega esa URL en la constante:
   ```js
   const ONLINE_SCORES_URL = ''; // ← pega aquí tu URL
   ```
4. Sube el cambio. Listo: al terminar una partida aparecerá el **🌐 Top 10
   global** junto al local.

Si la constante queda vacía o no hay conexión, el juego sigue funcionando con el
Top 5 local sin ningún problema.
