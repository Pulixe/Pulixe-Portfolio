# Usa una imagen base ligera de Nginx
FROM nginx:alpine-slim

# Elimina el archivo de configuración de Nginx por defecto
RUN rm /etc/nginx/conf.d/default.conf

# Copia tu archivo de configuración personalizado de Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia los archivos compilados de React en el directorio que Nginx usará para servir contenido
COPY dist/ /usr/share/nginx/html

# Expone el puerto 80 para que sea accesible desde fuera del contenedor
EXPOSE 80

# Comando por defecto para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
