#!/bin/sh
flux bootstrap github \
  --owner=unix0003 \
  --repository=cluster \
  --branch=main \
  --path=./apps/base \
  --personal 
