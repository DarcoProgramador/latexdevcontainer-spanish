# Plantilla LaTeX con Dev Container (Español)

Este repositorio proporciona un entorno listo para trabajar con LaTeX en español dentro de un Dev Container de VS Code. Ideal para compilar documentos de forma reproducible sin instalar LaTeX en tu máquina local.

## Requisitos

- Visual Studio Code
- Extensión "Dev Containers" o "Remote - Containers" (oficial de Microsoft)
- Docker Desktop en ejecución

## Inicio rápido

1. Abre este repositorio en VS Code.
2. Cuando se te pregunte, selecciona "Reabrir en Contenedor". Si no aparece, usa:
   - Command Palette → "Dev Containers: Reopen in Container".
3. El contenedor descargará la imagen y preparará las dependencias LaTeX.
4. Coloca tus archivos `.tex` en la raíz o en subcarpetas y compila.

## Compilación

Dentro del contenedor puedes usar `latexmk` para compilar automáticamente los documentos:

- Compilación PDF (pdflatex/xelatex/luatex según configuración):
  - `latexmk -pdf documento.tex`
- Compilación continua (watch):
  - `latexmk -pdf -pvc documento.tex`
- Limpiar artefactos generados:
  - `latexmk -c`

Si prefieres, puedes usar tareas de VS Code o scripts en `shell/`.

## Estructura sugerida

- `main.tex`: archivo principal del documento.
- `figuras/`: imágenes y gráficos.
- `bibliografia/`: archivos `.bib` y estilos.
- `estilos/`: comandos personalizados, paquetes y configuraciones.
- `shell/`: scripts auxiliares para compilar o limpiar.
- `.devcontainer/`: definición del contenedor de desarrollo.

## Personalización del Dev Container

Edita `.devcontainer/devcontainer.json` para:
- Instalar paquetes adicionales de LaTeX o utilidades.
- Configurar extensiones de VS Code por defecto.
- Mapear puertos, variables de entorno y features.

## .gitignore

Se incluye un `.gitignore` adaptado a LaTeX que excluye artefactos de compilación (`.aux`, `.log`, `.toc`, etc.), directorios de salida (`build/`, `out/`) y metadatos de editores.

## Consejos

- Usa `
  % !TeX program = xelatex
  `
  al inicio del `.tex` si quieres forzar un motor distinto.
- Para documentos grandes, considera externalizar TikZ y usar `latexmkrc` para opciones por defecto.

## Basado en
devcontainer de latex basado en el repo de https://github.com/qdm12/latexdevcontainer

## Licencia

Este proyecto se distribuye bajo la licencia MIT. Ajusta si lo necesitas.
