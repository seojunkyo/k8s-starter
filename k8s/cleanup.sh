#!/bin/bash
kctl=microk8s.kubectl
$kctl delete namespace sample
$kctl delete -f ./mysql-pv.yml -n sample
$kctl delete -f ./pgsql-pv.yml -n sample
sudo rm -rf /var/data/*
