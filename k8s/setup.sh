#!/bin/bash
kctl=microk8s.kubectl
$kctl create namespace sample
secrets=$($kctl apply -k . -n sample | sed -n 's/.*\/\(.*\)\s.*/\1/p' )
mysql_pass=$(echo "$secrets" | grep mysql)
pgsql_pass=$(echo "$secrets" | grep pgsql)
$kctl apply -f ./storageclass.yml -n sample
$kctl apply -f ./mysql-pv.yml -n sample
$kctl apply -f ./pgsql-pv.yml -n sample
cat mysql-deployment.yml | sed "s/mysql-pass-xxxx/${mysql_pass}/" | $kctl apply -n sample -f -
cat pgsql-deployment.yml | sed "s/pgsql-pass-xxxx/${pgsql_pass}/" | $kctl apply -n sample -f -
# microk8s.enable ingress
# microk8s.kubectl edit -n ingress ds/nginx-ingress-microk8s-controller
# spec > template > spec > containers > args 에 `--http-port=xxxx` 옵션 추가
