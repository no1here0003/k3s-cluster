#!/bin/sh

# Make sure to run me with sudo.

docker pull plndr/kube-vip:v0.4.2
alias kube-vip="docker run --network host --rm plndr/kube-vip:v0.4.2"

kube-vip manifest daemonset \
    --arp \
    --interface eth0 \
    --address 192.168.2.5 \
    --controlplane \
    --leaderElection \
    --taint \
    --inCluster | tee /var/lib/rancher/k3s/server/manifests/kube-vip.yaml

exit
