resource "helm_release" "metallb" {
  count = 1
  name       = "metallb"
  create_namespace = true
  namespace = "metallb-system"
  repository = "https://metallb.github.io/metallb"
  chart      = "metallb"
  values = [
    "${file("../../manifests/metallb/values.yaml")}"
  ]
}

# Wait for stuff to settle down
resource "time_sleep" "metallb" {
  depends_on = [helm_release.metallb]
  count = 1
  create_duration = "10s"
}

resource "helm_release" "cert-manager" {
  depends_on = [time_sleep.metallb]
  count = 1
  name       = "cert-manager"
  create_namespace = true
  namespace = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  values = [
    "${file("../../manifests/cert-manager/values.yaml")}"
  ]
}

# Wait for stuff to settle down
resource "time_sleep" "certmanager" {
  depends_on = [helm_release.cert-manager]
  count = 1
  create_duration = "10s"
}

resource "helm_release" "nginx_ingress" {
  depends_on = [time_sleep.certmanager]
  count = 1
  name       = "ingress-nginx"
  create_namespace = true
  namespace = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  set {
    name  = "controller.hostNetwork"
    value = ""
  }
  set {
    name = "dnsPolicy"
    value = "ClusterFirstWithHostNet"
  }
}


# Below is a temporary work around for ingress webhook being angry
resource "time_sleep" "nginx_ingress" {
  depends_on = [helm_release.nginx_ingress]
  count = 1
  create_duration = "10s"
  provisioner "local-exec" {
    command = "kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission"
  }
}


# apply cloudflare token key
resource "time_sleep" "certsecret" {
  depends_on = [helm_release.nginx_ingress]
  count = 1
  create_duration = "1s"
  provisioner "local-exec" {
    command = "kubectl apply -f ~/secret.yaml -n cert-manager"
  }
}


# sleep below is to allow things to settle before attemping longhorn install. also installs longhorn ingress
resource "time_sleep" "longhorn_sleep" {
  depends_on = [helm_release.nginx_ingress]
  count = 1
  create_duration = "20s"
  provisioner "local-exec" {
    command = "kubectl apply -f ../manifests/longhorn/ing.yml"
  }
}

resource "helm_release" "longhorn" {
  depends_on = [time_sleep.longhorn_sleep]
  count = 1
  name       = "longhorn"
  create_namespace = true
  namespace = "lonbghorn-system"
  repository = "https://charts.longhorn.io"
  chart      = "longhorn"
}

resource "time_sleep" "wait_for_longhorn" {
  depends_on = [helm_release.longhorn]
  count = 1
  create_duration = "10s"

  provisioner "local-exec" {
    command = "kubectl apply -f ../manifests/longhorn/ing.yml"
  }
}