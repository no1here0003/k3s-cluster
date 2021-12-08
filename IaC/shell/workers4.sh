#!/bin/sh


k3sup join \
  --ip 192.168.2.202 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube

k3sup join \
  --ip 192.168.2.122 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube

k3sup join \
  --ip 192.168.2.123 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube

k3sup join \
  --ip 192.168.2.111 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube

k3sup join \
  --ip 192.168.2.121 \
  --user kube \
  --k3s-channel stable \
  --server-ip 192.168.2.100 \
  --server-user kube