# Using a compact OS
FROM daocloud.io/nginx:1.11-alpine

RUN apk --update add curl

EXPOSE 80

HEALTHCHECK CMD curl --fail http://localhost:81/ || exit 1

# Start Nginx and keep it running background and start php
CMD sed -i "s/ContainerID: /ContainerID: "$(hostname)"/g" /usr/share/nginx/html/index.html && nginx -g "daemon off;"

# Add 2048 stuff into Nginx server
COPY . /usr/share/nginx/html

