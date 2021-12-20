#!/bin/sh


k3sup join \
  --ip 192.168.1.25 \
  --user kube \
  --k3s-channel latest \
  --server-ip 192.168.2.100 \
  --server-user kube
