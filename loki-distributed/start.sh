#!/bin/bash

kind create cluster --config kind.yaml

## Install and configure loki (minio included), grafana, and promtail

helm repo add grafana https://grafana.github.io/helm-charts
helm upgrade --install loki grafana/loki -f loki.yaml
helm upgrade --install promtail grafana/promtail -f promtail.yaml
helm upgrade --install grafana grafana/grafana
