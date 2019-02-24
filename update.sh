#!/bin/sh

HOST=$1

if [ "${HOST}" = "" ]; then
  echo "$0 <domain>"
  exit 1
fi

/root/.acme.sh/.acme.sh --home /var/www --renew -d ${HOST}
/root/.acme.sh/.acme.sh --home /var/www --install-cer -d ${HOST} \
  --fullchain-file /var/www/${HOST}/nginx.cert.pem \
  --key-file       /var/www/${HOST}/nginx.key.pem
