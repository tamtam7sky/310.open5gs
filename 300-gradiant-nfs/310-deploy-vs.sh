#!/usr/bin/bash
set -xueo pipefail


cat <<EOF | kubectl -n open5gs apply -f -
apiVersion: networking.istio.io/v1alpha3
kind: Gateway
metadata:
  name: gw
  namespace: open5gs
spec:
  # The selector matches the ingress gateway pod labels.
  # If you installed Istio using Helm following the standard documentation, this would be "istio=ingress"
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: http
      protocol: HTTP
    hosts:
    - ogs.k8s
---
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: vs-for-ogs-webui
  namespace: open5gs
spec:
  hosts:
  - ogs.k8s
  gateways:
  - gw
  http:
  - route:
    - destination:
        port:
          number: 9999
        host: open5gs-webui.open5gs.svc.cluster.local
EOF


kubectl get gateway,virtualservice -A


# on Mac
# echo "192.168.11.128      ogs.k8s" | sudo tee -a /etc/hosts
# curl http://ogs.k8s/
# username: admin
# password: 1423
