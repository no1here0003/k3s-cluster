#!/bin/sh

k3sup join \
  --ip 192.168.2.150 \
  --user kube \
  --k3s-channel stable \
  --server \
  --server-ip 192.168.2.100 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --flannel-backend=wireguard --no-deploy=servicelb --node-ip=192.168.2.150"

k3sup join \
  --ip 192.168.2.200 \
  --user kube \
  --k3s-channel stable \
  --server \
  --server-ip 192.168.2.100 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik --no-deploy=servicelb  --flannel-backend=wireguard --node-ip=192.168.2.200"

