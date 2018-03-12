#!/bin/bash
NAMESPACE="${1:-default}"
echo $NAMESPACE

kubectl create -n $NAMESPACE -f templates/configmaps
kubectl create -n $NAMESPACE -f templates/secrets
kubectl create -n $NAMESPACE -f templates/persistentvolumeclaims
kubectl create -n $NAMESPACE -f templates/services
kubectl create -n $NAMESPACE -f templates/deployments
kubectl create -n $NAMESPACE -f templates/ingresses