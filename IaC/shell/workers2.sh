#!/bin/sh

k3sup join \
  --ip 192.168.2.151 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.100 \
  --server-user kube 

k3sup join \
  --ip 192.168.2.152 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.100 \
  --server-user kube 

k3sup join \
  --ip 192.168.2.121 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.100 \
  --server-user kube