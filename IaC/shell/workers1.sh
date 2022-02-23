#!/bin/sh

k3sup join \
  --ip 192.168.3.20 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.21 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.22 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube
