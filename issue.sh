#!/bin/sh

HOST=$1
shift

if [ "${HOST}" = "" ]; then
  echo "$0 <domain1> <domain2> <domain3> ..."
  exit 1
fi

CMD="/root/.acme.sh/acme.sh --home /var/www --issue --standalone -d ${HOST}"

while [ "$1" != "" ]; do
  CMD+=" -d $1"
  shift
done

`${CMD}`
/root/.acme.sh/.acme.sh --home /var/www --install-cer -d ${HOST} \
  --fullchain-file /var/www/${HOST}/nginx.cert.pem \
  --key-file       /var/www/${HOST}/nginx.key.pem
