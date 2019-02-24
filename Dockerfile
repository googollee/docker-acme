FROM nginx:stable-alpine

VOLUME /var/www
EXPOSE 80

RUN apk add --no-cache curl openssl sed socat && \
    curl https://get.acme.sh | /bin/sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY issue.sh /issue.sh
COPY update.sh /update.sh
