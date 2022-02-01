#!/bin/sh


k3sup join \
  --ip 192.168.2.111 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.141 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.142 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube
