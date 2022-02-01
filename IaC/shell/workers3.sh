#!/bin/sh

k3sup join \
  --ip 192.168.2.131 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.132 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.133 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube
