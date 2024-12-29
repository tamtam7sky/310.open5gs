#!/usr/bin/bash
set -xueo pipefail

if (kubectl get pv pv0001); then
	kubectl delete pv pv0001 --force
fi

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv0001
spec:
  capacity:
    storage: 8Gi
  accessModes:
    - ReadWriteMany
  storageClassName: "slow"
  persistentVolumeReclaimPolicy: Recycle
  nfs:
    server: 192.168.11.100
    path: /export/nfs/share/pv0001
EOF

kubectl get pv -A

