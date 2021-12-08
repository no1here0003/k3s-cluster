#!/bin/sh

k3sup join \
  --ip 192.168.2.101 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube 

k3sup join \
  --ip 192.168.2.102 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube

k3sup join \
  --ip 192.168.2.201 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube