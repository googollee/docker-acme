FROM nginx:stable-alpine

RUN apk add --no-cache curl openssl sed socat && \
    curl https://get.acme.sh | /bin/sh

VOLUME /var/cert
EXPOSE 80

COPY nginx.conf /etc/nginx/nginx.conf
COPY issue.sh /issue.sh
COPY update.sh /update.sh
