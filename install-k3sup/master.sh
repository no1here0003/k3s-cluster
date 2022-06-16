#!/bin/sh +vx

k3sup install \
  --ip 192.168.2.15 \
  --user kube \
  --cluster \
  --k3s-channel stable \
  --tls-san 192.168.2.5 \
  --sudo \
  --k3s-extra-args "--no-deploy=servicelb --no-deploy=traefik --flannel-backend=none --node-ip=192.168.2.15 --cluster-cidr=10.42.0.0/16 --write-kubeconfig-mode=644 --etcd-expose-metrics=true" \
  --context=k3s-ha \
  --merge
