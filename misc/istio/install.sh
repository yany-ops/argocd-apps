#!/bin/bash

istioctl install --context=ops --set profile=demo -f ops.yaml
istioctl install --context=prod --set profile=demo -f prod.yaml

istioctl create-remote-secret --context=ops --name=ops-cluster | kubectl apply -f - --context=prod
istioctl create-remote-secret --context=prod --name=prod-cluster | kubectl apply -f - --context=ops