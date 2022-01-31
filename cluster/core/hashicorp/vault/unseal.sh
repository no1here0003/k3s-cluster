#!/bin/sh
#export VAULT_SEAL1=""
#export VAULT_SEAL2=""
#export VAULT_SEAL3=""

kubectl exec --stdin=true --tty=true vault-0 -n hashicorp -- vault operator unseal $VAULT_SEAL1
kubectl exec --stdin=true --tty=true vault-1 -n hashicorp -- vault operator unseal $VAULT_SEAL1
kubectl exec --stdin=true --tty=true vault-2 -n hashicorp -- vault operator unseal $VAULT_SEAL1
kubectl exec --stdin=true --tty=true vault-0 -n hashicorp -- vault operator unseal $VAULT_SEAL2
kubectl exec --stdin=true --tty=true vault-1 -n hashicorp -- vault operator unseal $VAULT_SEAL2
kubectl exec --stdin=true --tty=true vault-2 -n hashicorp -- vault operator unseal $VAULT_SEAL2
kubectl exec --stdin=true --tty=true vault-0 -n hashicorp -- vault operator unseal $VAULT_SEAL3
kubectl exec --stdin=true --tty=true vault-1 -n hashicorp -- vault operator unseal $VAULT_SEAL3
kubectl exec --stdin=true --tty=true vault-2 -n hashicorp -- vault operator unseal $VAULT_SEAL3
