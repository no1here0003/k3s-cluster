#!/bin/sh

echo '192.168.2.110'

k3sup join \
  --ip 192.168.2.110 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.2.5 \
  --server-user kube \
  --no-extras \
  --sudo \
  --k3s-extra-args "--flannel-backend=wireguard --node-ip=192.168.2.110 --write-kubeconfig-mode=644 --etcd-expose-metrics=true"


echo '192.168.2.120'

k3sup join \
  --ip 192.168.2.120 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.2.5 \
  --server-user kube \
  --no-extras \
  --sudo \
  --k3s-extra-args "--flannel-backend=wireguard --node-ip=192.168.2.120 --write-kubeconfig-mode=644 --etcd-expose-metrics=true"
