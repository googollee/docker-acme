#!/bin/sh

HOST=$1
shift

if [ "${HOST}" = "" ]; then
  echo "$0 <main domain> [ <alt domain 1> <alt domain 2> ... ]"
  exit 1
fi

CMD="/root/.acme.sh/acme.sh --home /var/www --issue --standalone -d ${HOST}"

while [ "$1" != "" ]; do
  CMD="${CMD} -d $1"
  shift
done

`${CMD}`
/root/.acme.sh/acme.sh --home /var/www --install-cert -d ${HOST} \
  --fullchain-file /var/www/${HOST}/nginx.cert.pem \
  --key-file       /var/www/${HOST}/nginx.key.pem
