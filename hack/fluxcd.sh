#!/bin/sh
flux bootstrap github \
  --owner=no1here0003 \
  --repository=home-cluster \
  --branch=main \
  --path=./apps/base \
  --personal 
