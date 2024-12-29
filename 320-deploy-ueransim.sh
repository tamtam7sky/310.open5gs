#!/usr/bin/bash
set -xueo pipefail

kubectl -n open5gs apply -f ueransim-gnb.yaml
sleep 3
kubectl -n open5gs apply -f ueransim-ues.yaml
