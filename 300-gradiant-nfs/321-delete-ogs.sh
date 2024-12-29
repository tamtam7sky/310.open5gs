#!/usr/bin/bash
set -xueo pipefail

kubectl -n open5gs delete -f manifest.yaml
