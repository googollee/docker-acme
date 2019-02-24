#!/bin/sh

HOME="/var/cert"
HOST=$1

if [ "${HOST}" = "" ]; then
  echo "$0 <domain>"
  exit 1
fi

mkdir -p ${HOME}/${HOST}/nginx
/root/.acme.sh/acme.sh --home ${HOME} --renew -d ${HOST}
/root/.acme.sh/acme.sh --home ${HOME} --install-cert -d ${HOST} \
  --fullchain-file ${HOME}/${HOST}/nginx/cert.pem \
  --key-file       ${HOME}/${HOST}/nginx/key.pem
