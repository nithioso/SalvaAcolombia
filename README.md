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

| Plataforma | Mover | Disparar | Pausa |
|------------|-------|----------|-------|
| 💻 **PC**  | ⬅️ ➡️ (flechas) | `Espacio` o clic | `P` / `Esc` o botón ⏸ |
| 📱 **Móvil** | Desliza el dedo | Automático al tocar | Botón ⏸ |

## ✨ Características

- **Nombre del jugador:** se solicita al iniciar cada partida.
- **Top 5 de puntajes:** se guardan en el navegador con `localStorage` y se
  muestran al terminar, resaltando tu posición. Incluye botón para borrarlos.
- **Dificultad progresiva:** en cada nivel la formación se mueve más rápido y
  los enemigos pican y disparan con mayor frecuencia. Los puntos se multiplican
  por el nivel alcanzado.
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
