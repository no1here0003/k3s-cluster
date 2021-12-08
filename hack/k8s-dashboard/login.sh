#!/bin/sh
kubectl -n k8s-dashboard get secret $(kubectl -n k8s-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

