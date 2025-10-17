# Contenedor de desarrollo

Contenedor de desarrollo que puede usarse con VS Code.

Funciona en Linux, Windows y macOS.

## Requisitos

- Tener instalado [Visual Studio Code](https://code.visualstudio.com/download)
- Tener instalada la extensión [Dev Containers (Remote - Containers)](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker Desktop](https://www.docker.com/products/docker-desktop) instalado y en ejecución
- [Docker Compose](https://docs.docker.com/compose/install/) instalado

## Configuración

1. Crea los siguientes archivos en tu sistema si no existen:

    ```sh
    touch ~/.gitconfig ~/.zsh_history
    ```

    Ten en cuenta que el contenedor de desarrollo creará los directorios vacíos `~/.docker` y `~/.ssh` si no existen.

1. **Para Docker en macOS o Windows sin WSL**: asegúrate de que tu directorio home `~` sea accesible por Docker.
1. **Para Docker en Windows sin WSL:** si deseas usar claves SSH, monta `~/.ssh` de tu host en `/tmp/.ssh` en lugar de `~/.ssh` modificando la sección `volumes` en [docker-compose.yml](docker-compose.yml).
1. Abre la paleta de comandos en Visual Studio Code (CTRL+SHIFT+P).
1. Selecciona `Remote-Containers: Open Folder in Container...` y elige el directorio del proyecto.

## Personalización

### Personalizar la imagen

Puedes hacer cambios al [Dockerfile](Dockerfile) y luego reconstruir la imagen. Por ejemplo, tu Dockerfile podría ser:

```Dockerfile
FROM qmcgaw/latexdevcontainer
RUN apk add curl
```

Para reconstruir la imagen, puedes:

- Con VS Code, mediante la paleta de comandos, seleccionar `Remote-Containers: Rebuild and reopen in container`
- Con una terminal, ve a este directorio y ejecuta `docker-compose build`

### Personalizar ajustes de VS Code

Puedes personalizar **settings** y **extensions** en el archivo de definición [devcontainer.json](devcontainer.json).

### Script de entrada (entrypoint)

Puedes montar un script de shell en `/home/vscode/.welcome.sh` para reemplazar el [script de bienvenida actual](shell/.welcome.sh).

### Publicar un puerto

Para acceder desde tu host a un puerto del contenedor de desarrollo, publica un puerto en [docker-compose.yml](docker-compose.yml). También puedes hacerlo directamente con VS Code sin reiniciar el contenedor.

### Ejecutar otros servicios

1. Modifica [docker-compose.yml](docker-compose.yml) para lanzar otros servicios al mismo tiempo que este contenedor de desarrollo, como por ejemplo una base de datos de pruebas:

    ```yml
      database:
        image: postgres
        restart: always
        environment:
          POSTGRES_PASSWORD: password
    ```

1. En [devcontainer.json](devcontainer.json), cambia la línea `"runServices": ["vscode"],` por `"runServices": ["vscode", "database"],`.
1. En la paleta de comandos de VS Code, reconstruye el contenedor.
