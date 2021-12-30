#!/bin/sh
k3sup join \
  --ip 192.168.2.130 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.2.100 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --no-deploy=servicelb  --flannel-backend=wireguard --node-ip=192.168.2.130 --write-kubeconfig-mode 644"
