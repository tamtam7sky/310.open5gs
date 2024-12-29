#!/usr/bin/bash
set -xueo pipefail

kubectl -n open5gs delete -f ueransim-ues.yaml
kubectl -n open5gs delete -f ueransim-ues-2.yaml
kubectl -n open5gs delete -f ueransim-ues-3.yaml
sleep 3
kubectl -n open5gs delete -f ueransim-gnb.yaml
kubectl -n open5gs delete -f ueransim-gnb-2.yaml
kubectl -n open5gs delete -f ueransim-gnb-3.yaml

