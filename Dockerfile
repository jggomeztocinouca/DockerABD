# Utilizar la imagen oficial de PostgreSQL
FROM postgres:latest

# Copiar el script SQL al contenedor
COPY ./init.sql /docker-entrypoint-initdb.d/

# Configurar variables de entorno
ENV POSTGRES_PASSWORD=ABD

# Jesús Gómez - jesus.gomeztocino@alum.uca.es