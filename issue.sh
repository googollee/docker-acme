#!/bin/sh

HOME="/var/cert"
HOST=$1
shift

if [ "${HOST}" = "" ]; then
  echo "$0 <main domain> [ <alt domain 1> <alt domain 2> ... ]"
  exit 1
fi

CMD="/root/.acme.sh/acme.sh --home ${HOME} --issue -w ${HOME} -d ${HOST}"

while [ "$1" != "" ]; do
  CMD="${CMD} -d $1"
  shift
done

mkdir -p ${HOME}/${HOST}/nginx
${CMD}
/root/.acme.sh/acme.sh --home ${HOME} --install-cert -d ${HOST} \
  --fullchain-file ${HOME}/${HOST}/nginx/cert.pem \
  --key-file       ${HOME}/${HOST}/nginx/key.pem
