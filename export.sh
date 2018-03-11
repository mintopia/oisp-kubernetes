cd templates
for n in $(kubectl get -n cloudfest -o=name pvc,configmap,secret,ingress,service,deployment,statefulset,hpa)
do
    mkdir -p $(dirname $n)
    kubectl get -n cloudfest -o=yaml --export $n > $n.yaml
done
cd ..
