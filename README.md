Para levantar el proyecto en un entorno local, es necesario contar con **docker** instalado.

## Instalación

Para instalar el proyecto, ejecutar los siguientes comandos en la raiz del proyecto:

1. `make start`
2. Abrir [http://localhost:3001](http://localhost:3001) en un navegador para visualizar el proyecto

## Comandos disponibles

### `make start`

Instala y levanta el proyecto.<br>
Abrir [http://localhost:3001](http://localhost:3001) en un navegador para visualizar el proyecto.

### `make stop`

Apaga el servidor del proyecto.<br>
Ya no estara disponible en [http://localhost:3001](http://localhost:3001). Es necesario ejecutar el comando `make start` nuevamente si de desea volver a levantar el proyecto.

### `make ssh`

Permite conectarse al contenedor via ssh.

### `make prd`

Crea un **build** del proyecto preparandolo para produccion.<br>
El compilado se creara en la siguente ruta: `application/build`

### `make test`

Ejecuta las pruebas unitarias del proyecto:<br>
**Nota**: Las pruebas se ejecutan en modo **watch** por lo que es necesario ejecutar `make docker-kill` al finalizar para eliminar el contenedor.

### `make test-ci`

Ejecuta las pruebas unitarias del proyecto desabilitando el modo **watch**

### `make test-coverage`

Ejecuta las pruebas unitarias del proyecto y crea un reporte de **coverage**<br>
**Nota**: Las pruebas se ejecutan en modo **watch** por lo que es necesario ejecutar `make docker-kill` al finalizar para eliminar el contenedor.

### `make test-coverage-ci`

Ejecuta las pruebas unitarias del proyecto y crea un reporte de **coverage** desabilitando el modo **watch**

### `make docker-kill`

Apaga todos los contenedores activos.

### `make docker-clean`

Elimina todos los contenedores, imagenes, almacenamientos y redes sin usar.

## Mas información

Para mas detalle sobre los comandos disponibles ejecute el comando:<br>
`make` dentro de la raiz del proyecto
