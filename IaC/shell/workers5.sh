#!/bin/sh


k3sup join \
  --ip 192.168.2.254 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.5 \
  --server-user kube
