#!/bin/sh


k3sup join \
  --ip 192.168.3.29 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.30 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube
