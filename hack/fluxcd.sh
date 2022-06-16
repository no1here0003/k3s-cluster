#!/bin/sh

kubectl create ns flux-system
sleep 3
cat ~/.config/sops/age/keys.txt | kubectl -n flux-system create secret generic sops-age \
--from-file=age.agekey=/dev/stdin



flux bootstrap github \
  --owner=no1here0003 \
  --repository=k3s-cluster \
  --branch=master \
  --path=./cluster/base \
  --personal
