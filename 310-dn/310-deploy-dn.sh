#!/usr/bin/bash
set -xueo pipefail

kubectl apply -f deployment.yaml -n open5gs

