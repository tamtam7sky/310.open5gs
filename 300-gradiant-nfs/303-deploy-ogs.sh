#!/usr/bin/bash
set -xueo pipefail

if !(kubectl get ns open5gs); then
	kubectl create ns open5gs
fi
kubectl label namespace open5gs istio-injection=enabled --overwrite
#kubectl label namespace open5gs istio-injection=disabled --overwrite
kubectl apply -f manifest.yaml -n open5gs
