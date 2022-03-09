k3sup join \
  --ip 192.168.3.8 \
  --user kube \
  --k3s-channel latest \
  --server \
  --server-ip 192.168.3.5 \
  --server-user kube \
  --sudo \
  --k3s-extra-args "--no-deploy=traefik ----no-deploy=servicelb --flannel-backend=wireguard --node-ip=192.168.3.8 --write-kubeconfig-mode=644 --etcd-expose-metrics=true feature-gates=MixedProtocolLBService=true"
