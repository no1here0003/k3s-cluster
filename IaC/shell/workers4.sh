#!/bin/sh

k3sup join \
  --ip 192.168.3.31 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.32 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.33 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube

k3sup join \
  --ip 192.168.3.34 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.3.5 \
  --server-user kube
