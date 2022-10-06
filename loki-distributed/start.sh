#!/bin/bash

kind create cluster --config kind.yaml

## Install and configure minio

#kubectl krew update
#kubectl krew install minio

#kubectl apply -f minio.yaml
#kcd minio-tenant-1

#kubectl minio init

#TENANT_NS=minio-tenant-1
#kubectl create namespace --name $TENANT_NS

#Akubectl minio tenant create tenant1 --servers 3 --volumes 6 --capacity 8G --namespace $TENANT_NS


## Install and configure loki

helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install loki grafana/loki -f loki.yaml
helm upgrade --install questdb questdb/questdb
helm upgrade --install promtail grafana/promtail -f promtail.yaml
helm upgrade --install grafana grafana/grafana
