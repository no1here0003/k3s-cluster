#!/bin/sh

k3sup join \
  --ip 192.168.2.200 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.2.100 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --flannel-backend=wireguard --no-deploy=servicelb --node-ip=192.168.2.200"

