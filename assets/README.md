# 📸 Fotos de los personajes (opcional)

> **El juego ya intenta cargar la foto real de cada personaje automáticamente
> desde Wikipedia** (la descarga la hace tu navegador al abrir el juego). Esta
> carpeta sirve solo para **anular** esa foto con una propia.

Orden de prioridad para la cara de cada personaje:

1. **Foto local** en esta carpeta (`assets/`), si existe.
2. **Foto de Wikipedia** (automática).
3. **Ilustración** dibujada en el lienzo (respaldo si no hay conexión).

Por eso **no es obligatorio** agregar nada aquí; hazlo solo si quieres una foto
distinta a la de Wikipedia o si vas a jugar sin conexión.

## Nombres de archivo

Usa exactamente estos nombres (se acepta `.png`, `.jpg`, `.jpeg` o `.webp`):

| Personaje              | Archivo            |
|------------------------|--------------------|
| Abelardo (jugador)     | `abelardo.png`     |
| José Manuel Restrepo (jugador) | `restrepo.png` |
| Gustavo Petro          | `petro.png`        |
| Iván Cepeda            | `cepeda.png`       |
| Francia Márquez        | `francia.png`      |
| Roy Barreras           | `roy.png`          |
| Gustavo Bolívar        | `bolivar.png`      |
| Armando Benedetti      | `benedetti.png`    |
| Aída Quilcué           | `quilcue.png`      |
| María José Pizarro     | `pizarro.png`      |
| Laura Sarabia          | `sarabia.png`      |
| Juliana Guerrero       | `guerrero.png`     |

## Cómo subir las fotos (sin instalar nada)

Por la web de GitHub:

1. Ve a **https://github.com/GringoInc/Galaga1/upload/main/assets**
   (o en el repo: carpeta `assets` → **Add file → Upload files**).
2. Arrastra tus imágenes con los **nombres exactos** de la tabla (p. ej.
   `sarabia.png`, `guerrero.png`, `restrepo.png`).
3. **Commit changes** a `main`. En 1–2 min GitHub Pages se actualiza y la foto
   aparece en el juego (refresca con `Ctrl/Cmd + Shift + R`).

La foto local **siempre gana** sobre la de Wikipedia, así que es la forma
garantizada de fijar la cara de cualquier personaje.

## Recomendaciones

- Imágenes **cuadradas** (por ejemplo 256×256 px) y centradas en la cara se ven
  mejor, ya que el juego las recorta en un círculo.
- Usa fotos sobre las que tengas derechos de uso.
