#!/bin/sh

kubectl create ns flux-system
sleep 5
kubectl apply -f ~/secrets/cluster-secrets.yaml
kubectl apply -f ~/secrets/cluster-settings.yaml
cat ~/.config/sops/age/keys.txt | kubectl -n flux-system create secret generic sops-age \
--from-file=age.agekey=/dev/stdin



flux bootstrap github \
  --owner=no1here0003 \
  --repository=home-cluster \
  --branch=master \
  --path=./cluster/base \
  --personal
