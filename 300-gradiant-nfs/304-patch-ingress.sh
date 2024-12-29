#!/usr/bin/bash
set -xueo pipefail

kubectl patch -n open5gs ingress/open5gs-webui --type json -p='[{"op": "replace", "path": "/spec/rules/0/host", "value": "open5gs"}]'
