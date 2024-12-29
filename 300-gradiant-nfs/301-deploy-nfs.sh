#!/bin/sh
set -x

sudo apt update && sudo apt install -y nfs-kernel-server
sudo mkdir -p /export/nfs/share
sudo chown  nobody:nogroup /export/nfs/share
sudo chmod 777 /export/nfs/share
echo "/export/nfs/share 172.18.0.0/255.255.0.0(rw,sync,no_subtree_check)" | sudo tee -a /etc/exports
sudo systemctl restart nfs-kernel-server
sudo exportfs -v

mkdir /export/nfs/share/pv0001
sudo chown nobody:nogroup /export/nfs/share/pv0001

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

