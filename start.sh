#!/bin/sh
docker-compose up -d
PORT=$(docker ps | grep desktopcontainers/virt-manager | tr ' ' '\n' | grep '\->' | sed -n 's/.*:\([0-9]*\)->.*/\1/gp' )

[ -z "$PORT" ] && exit 1

printf "loading."
while ! ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $PORT app@127.0.0.1 true 2>/dev/null >/dev/null; do
  printf "."
  sleep 1
done
printf '\n'

ssh -Y -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -p $PORT app@127.0.0.1 app

docker-compose down