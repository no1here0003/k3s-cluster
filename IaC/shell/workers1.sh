#!/bin/sh

k3sup join \
  --ip 192.168.2.113 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube 

k3sup join \
  --ip 192.168.2.114 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube 

k3sup join \
  --ip 192.168.2.115 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube 