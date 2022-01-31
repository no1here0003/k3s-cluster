#!/bin/sh

# Initialize and get unseal codes
kubectl exec --stdin=true --tty=true vault-0 -n hashicorp -- vault operator init
