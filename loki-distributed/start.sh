#!/bin/bash

kind create cluster --config kind.yaml
kubectx kind-kind

## Install and configure loki (minio included), grafana, and promtail

helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install loki grafana/loki -f loki.yaml -n logging --create-namespace
helm upgrade --install promtail grafana/promtail -f promtail.yaml -n logging
helm upgrade --install grafana grafana/grafana -n logging

## Install questdb in a separate namespace
helm repo add questdb https://helm.questdb.io/
helm upgrade --install questdb questdb/questdb -n questdb-tenant-1 --create-namespace
