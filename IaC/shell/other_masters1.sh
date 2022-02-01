#!/bin/sh

echo '192.168.2.200'

k3sup join \
  --ip 192.168.2.130 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.2.140 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --no-deploy=servicelb  --flannel-backend=wireguard --node-ip=192.168.2.130 --write-kubeconfig-mode 644 --etcd-expose-metrics"

k3sup join \
  --ip 192.168.2.143 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.2.140 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --flannel-backend=wireguard --no-deploy=servicelb --node-ip=192.168.2.143 --write-kubeconfig-mode 644 --etcd-expose-metrics"
