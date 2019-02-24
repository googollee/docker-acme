FROM nginx:stable-alpine

VOLUME /var/www
EXPOSE 80

RUN apk add openssl socat curl && \
    curl https://get.acme.sh | /bin/sh

COPY nginx.conf /etc/nginx/nginx.conf
