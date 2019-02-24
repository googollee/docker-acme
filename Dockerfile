FROM nginx:stable-alpine

VOLUME /var/www
EXPOSE 80

RUN apk add openssl socat && \
    wget -O -  https://get.acme.sh | /bin/sh

COPY nginx.conf /etc/nginx/nginx.conf
