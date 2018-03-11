for n in $(kubectl get -n cloudfest -o=name pvc,configmap,serviceaccount,secret,ingress,service,deployment,statefulset,hpa,job,cronjob)
do
    mkdir -p $(dirname $n)
    kubectl get -n cloudfest -o=yaml --export $n > $n.yaml
done
