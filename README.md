# Guía de instalación y mantenimiento de las herramientas para la asignatura Administración de Bases Datos.

## Tecnologías a usar

1. **PostgreSQL**: Sistema de gestión de bases de datos relacional objeto (ORDBMS) de código abierto. Ddestaca por su robustez, escalabilidad y capacidad para manejar grandes volúmenes de datos. Ofrece una amplia variedad de tipos de datos, como JSON y XML, y cuenta con extensibilidad para definir tipos y funciones propias. Además, PostgreSQL es conocido por su conformidad con los estándares SQL y su flexibilidad para manejar transacciones, vistas y procedimientos almacenados.
2. **Docker**: Plataforma de contenedores (virtualización a nivel de S.O) de código abierto que permite desarrollar, enviar y ejecutar aplicaciones en un entorno aislado y seguro. Facilita la automatización del despliegue de aplicaciones dentro de contenedores ligeros, los cuales son independientes del sistema operativo anfitrión. Esto permite un alto grado de portabilidad, eficiencia en el uso de recursos y facilidad de escalabilidad y orquestación.

## ¿Por qué Docker?

### Consistencia

Docker ofrece un ambiente de desarrollo unificado, eliminando así el problema de inconsistencias entre distintos sistemas operativos o dependencias necesarias.

### Eficiencia

A diferencia de las máquinas virtuales, Docker es más eficiente en el uso de recursos al compartir el sistema operativo del anfitrión.

### Portabilidad y automatización

Docker empaqueta la aplicación y sus dependencias en un solo contenedor, facilitando su despliegue en cualquier sistema con Docker instalado. Esto permite ahorrar al desarrollador el proceso de configuración de la tecnología en el sistema operativo elegido.

### Seguridad

Los servicios como _Docker Compose_ permiten aislar los datos del sistema, por lo que si surge algún fallo en el sistema del contenedor, bastaría con restablecer los ajustes predeterminados (destruir y reconstruir el contendor) sin perder información alguna.

## Contenido del directorio

### _Dockerfile_

En este archivo se especifica la imagen de la tecnología sobre la que trabajar. En este caso, se usará la imagen oficial de _PostgreSQL_ en su última versión, e implementado sobre Debian, para construir el contendor.

Este archivo también configura la contraseña de acceso a la base de datos, siendo por defecto 'ABD'.

### _docker-compose.yml_

Este archivo crea:

- Un volumen persistente para almacenar los datos de la base de datos. Esto resulta útil por si surgiera algún tipo de error en el contendor utilizado, permitiendo reconstruirlo y aplicar los ajustes predeterminados sin perder ningún dato.
- Una carpeta compartida entre el contenedor y la máquina host, conveniente para crear los archivos SQL para cada ejercicio de la asignatura.

El nombre de la carpeta compartida es 'Ejercicios' y podrá encontrarla en el directorio 'DockerABD' al construir el contenedor (véase en el apartado 'Construcción y ejecución del contenedor').

Dicha carpeta compartida facilita el acceso a los archivos desde el S.O anfitrión y evita la pérdida de estos en el almacenamiento temporal que ofrece PostgreSQL por defecto.

Es altamente recomendable establecer un control de versiones para este directorio, usted podrá sacar un gran beneficio de usar este tipo de herramientas.

### _init.sql_

Este archivo SQL se copia, al construir el contenedor, al directorio de inicialización de PostgreSQL. Consúltelo para ver las tablas y registros añadidos.

## Construcción, ejecución y gestión del contenedor

### Requerimientos

**Es necesario instalar la herramienta Docker y descomprimir el archivo descargado antes de continuar con los siguientes apartados.**

Visite la página web de [Docker](https://docs.docker.com/get-docker/). Descargue e instale la herramienta para su sistema operativo.

### Construcción del contenedor

1. Abra la terminal de su S.O anfitrión.
2. Sitúese dentro de la carpeta '_DockerABD_'.
3. Ejecute el siguiente comando: `docker-compose build`. Esto construirá la imagen y creará el contendor y los volúmenes asociados.
4. Ejecute el siguiente comando: `docker-compose up -d`. Esto iniciará, por primera vez, la ejecución los contenedores en segundo plano.

### Ejecución del contenedor

Siga estos pasos **únicamente** si ha realizado la construcción del contenedor e inicia el contenedor, al menos, por segunda vez.

1. Abra la terminal de su S.O anfitrión.
2. Ejecute el siguiente comando: `docker start ABD`.

### Parar el contenedor

Siga estos pasos si necesita hacer alguna modificación sobre el contendor, o simplemente desea pararlo porque su ejecución no siga siendo necesaria.

1. Abra la terminal de su S.O anfitrión.
2. Ejecute el siguiente comando: `docker stop ABD`.

### Restablecer el contedor

Siga estos pasos si encuentra algún problema a la hora de trabajar con el contenedor, ya que restablecer las configuraciones puede solucionar la mayoría de ellos.

**Este proceso**, aunque elimine y construya de nuevo el contenedor, **no borrará sus datos**, ya que se encuentran en un volumen aislado.

1. Abra la terminal de su S.O anfitrión.
2. Sitúese dentro de la carpeta '_DockerABD_'.
3. Ejecute el siguiente comando: `docker-compose restart`.

### Eliminar el contenedor

Siga estos pasos si ya no necesita disponer de estas herramientas (por ejemplo, porque haya usted aprobado la asignatura con buena nota 😎).

1. Abra la terminal de su S.O anfitrión.
2. Sitúese dentro de la carpeta '_DockerABD_'.
3. Ejecute el siguiente comando: `docker-compose down`.

Todavía sus datos no han sido eliminados. **Asegúrese de que no necesita cualquier información que estuviese en el contendor antes de continuar con el siguiente paso.**

4. Ejecute el siguiente comando: `docker volume rm dockerabd_postgres-data`.
5. Ejecute el siguiente comando: `docker volume rmi imagenabd`.

## Acceso a la terminal del contedor

Siga estos pasos si necesita abrir una terminal sobre el contenedor:

1. Abra la terminal de su S.O anfitrión.
2. Ejecute el siguiente comando: `docker exec -it ABD bash`.

Se abrirá la terminal del contedor sobre su terminal del sistema operativo anfitrión. Ahora usted podrá tanto gestionar el sistema operativo subyacente (Debian) del contenedor como acceder a PostgreSQL.

Nota: Si ejecuta el comando `ls` justo después de acceder a dicha terminal, podrá ver que existe una carpeta llamada '_Ejercicios_'. Esta carpeta es la misma que figura en su directorio '_DockerABD_' en el S.O anfitrión (véase el apartado '_Contenido de la carpeta_' para más información).

###### Jesús Gómez - jesus.gomeztocino@alum.uca.es
