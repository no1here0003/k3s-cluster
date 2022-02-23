#!/bin/sh
pwd
export INSTALL_K3S_SKIP_DOWNLOAD=true
k3sup install \
  --ip=192.168.3.2 \
  --user=kube \
  --sudo \
  --tls-san=192.168.3.5 \
  --cluster \
  --no-extras \
  --k3s-channel=latest \
  --k3s-extra-args "--flannel-backend=wireguard --node-ip=192.168.3.2  --write-kubeconfig-mode=644 --etcd-expose-metrics=true feature-gates=MixedProtocolLBService=true" \
  --local-path ~/.kube/config \
  --context=k3s

export KUBECONFIG=~/.kube/config

#cp /var/jenkins_home/kube/config config.json
sleep 5
kubectl apply -f https://kube-vip.io/manifests/rbac.yaml
scp -o StrictHostKeyChecking=no ./kubevip.sh kube@192.168.3.2:~  && \
ssh -o StrictHostKeyChecking=no kube@192.168.3.2 "sudo ./kubevip.sh"
