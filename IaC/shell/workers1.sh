#!/bin/sh


k3sup join \
  --ip 192.168.1.10 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.240 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.254 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.211 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube

k3sup join \
  --ip 192.168.2.201 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.140 \
  --server-user kube
