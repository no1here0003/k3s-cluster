#!/bin/sh

echo '192.168.2.200'

k3sup join \
  --ip 192.168.2.200 \
  --user kube \
  --k3s-channel stable \
  --server \
  --server-ip 192.168.2.100 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --no-deploy=servicelb  --flannel-backend=wireguard --node-ip=192.168.2.200"
