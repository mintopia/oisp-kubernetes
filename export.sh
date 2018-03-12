#!/bin/sh
cd templates
for n in $(kubectl get -n cloudfest-1 -o=name pvc,configmap,secret,ingress,service,deployment,statefulset,hpa)
do
    mkdir -p $(dirname $n)
    kubectl get -n cloudfest-1 -o=yaml --export $n > $n.yaml
done
cd ..
