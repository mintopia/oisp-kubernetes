#!/bin/bash
NAMESPACE="${1:-default}"
echo $NAMESPACE

kubectl create -f templates/configmaps
kubectl create -f templates/secrets
kubectl create -f templates/persistentvolumeclaims
kubectl create -f templates/services
kubectl create -f templates/deployments