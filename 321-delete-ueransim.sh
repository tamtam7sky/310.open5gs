#!/usr/bin/bash
set -xueo pipefail

kubectl -n open5gs delete -f ueransim-ues.yaml
sleep 3
kubectl -n open5gs delete -f ueransim-gnb.yaml

