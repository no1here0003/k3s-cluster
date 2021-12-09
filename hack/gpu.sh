#!/bin/sh
kubectl taint nodes kube-worker6 gpu=true:NoSchedule-
