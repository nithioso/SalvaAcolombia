# 🛡️ SalvaAcolombia

Juego de arcade tipo **Galaga** hecho con HTML, CSS y JavaScript puro (sin
dependencias). Controlas a **Abelardo de la Espriella** y debes derribar a los
personajes del **Pacto Histórico** antes de que aterricen.

## 🎮 Cómo jugar

1. Abre el archivo `index.html` en cualquier navegador moderno.
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
- **Personajes dibujados con código** (caricaturas en `<canvas>`), por lo que no
  se necesitan imágenes externas:
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

Al ser un solo archivo estático, puedes abrirlo localmente o publicarlo en
cualquier hosting estático (GitHub Pages, Netlify, etc.) sin compilación.
