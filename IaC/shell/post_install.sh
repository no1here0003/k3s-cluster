#!/bin/sh
# Install metallb for a load balancer
helm install metallb metallb/metallb --namespace metallb-system --create-namespace \
  -f ../manifests/metallb/values.yaml
sleep 10

kubectl get po -n metallb-system

# Install certmanager for certificate mamnagement
helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  -f ../manifests/cert-manager/values.yaml
sleep 5
kubectl get po -n cert-manager

# Install the nginx ingress controller
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace \
  --set controller.hostNetwork=true \
  --set dnsPolicy=ClusterFirstWithHostNet

sleep 10
kubectl get po -n ingress-nginx

# Below is a temporary work-around for an issue with bare metal clusters
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission

# Load secret
kubectl apply -f ~/secret.yml -n cert-manager

# load issue
kubectl apply -f ../../manifests/cert-manager/certmanager.yml -n cert-manager

sleep 10
# Now longhorn for storage management
helm install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace \
 -f ../manifests/longhorn/values.yaml

sleep 10

#longhorn ingress
kubectl apply -f ../manifests/longhorn/ing.yml

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --create-namespace=true \
  --set hostname=rancher.192.168.2.50.nip.io \
  --set replicas=3


sleep 5

kubectl -f apply /Users/nathanwinstel/cluster/manifests/rancher/ing.yml -n cattle-system