#!/bin/sh
pwd
export INSTALL_K3S_SKIP_DOWNLOAD=true
k3sup install \
  --ip=192.168.2.100 \
  --user=kube \
  --sudo \
  --tls-san=192.168.2.5 \
  --cluster \
  --k3s-channel=latest \
  --k3s-extra-args "--no-deploy=traefik --no-deploy=servicelb --flannel-backend=wireguard --node-ip=192.168.2.100  --write-kubeconfig-mode 644" \
  --local-path /var/jenkins_home/kube/config \
  --context=k3s

export KUBECONFIG=/var/jenkins_home/kube/config

chmod 777 /var/jenkins_home/kube/config
ls -al /var/jenkins_home/kube
#echo 'I am here ======> `pwd` <========='
#cp /var/jenkins_home/kube/config config.json
sleep 5
kubectl apply -f https://kube-vip.io/manifests/rbac.yaml
scp -o StrictHostKeyChecking=no IaC/shell/kubevip.sh kube@192.168.2.100:~  && \
ssh -o StrictHostKeyChecking=no kube@192.168.2.100 "sudo ./kubevip.sh"

