#!/bin/sh

k3sup join \
  --ip 192.168.3.26 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.27 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.28 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube
