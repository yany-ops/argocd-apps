#!/bin/bash

kubectl config use-context ops
istioctl install --context=ops -f ops.yaml
kubectl config use-context prod
istioctl install --context=prod -f prod.yaml

istioctl create-remote-secret --context=ops --name=ops-cluster | kubectl apply -f - --context=prod
istioctl create-remote-secret --context=prod --name=prod-cluster | kubectl apply -f - --context=ops