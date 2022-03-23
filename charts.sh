#!/usr/bin/env bash

set -o xtrace

OWNER=boeboe
GITHUB_REPO=istio-helm-charts
CHARTS_REPO=https://boeboe.github.io/istio-helm-charts

# Check local requirements (binaries used during the installation process)
function check_local_requirements {
  if ! command -v cr &> /dev/null
  then
      echo "cr could not be found, please install this on your local system first"
      echo "download location is https://github.com/helm/chart-releaser/releases"
      exit
  fi
}

check_local_requirements

if [[ $1 = "package" ]]; then
  cr package charts/istio/base
  cr package charts/istio/gateways/istio-egress/
  cr package charts/istio/gateways/istio-ingress/
  cr package charts/istio/istio-cni/
  cr package charts/istio/istio-control/istio-discovery/
  cr package charts/istio/istio-operator/
  cr package charts/istio/istiod-remote/

  cr package charts/istio-monitoring/elastic-stack
  cr package charts/istio-monitoring/grafana-stack
  cr package charts/istio-monitoring/kiali-stack

  exit 0
fi

if [[ $1 = "upload" ]]; then
  echo "What is your github token? "
  read -r GITHUB_TOKEN
  cr upload --owner ${OWNER} --git-repo ${GITHUB_REPO} --token ${GITHUB_TOKEN} --skip-existing
  exit 0
fi

if [[ $1 = "index" ]]; then
  echo "What is your github token? "
  read -r GITHUB_TOKEN
  cr index --owner ${OWNER} --git-repo ${GITHUB_REPO} --charts-repo ${CHARTS_REPO} --token ${GITHUB_TOKEN}
  mv .cr-index/index.yaml .
  exit 0
fi

if [[ $1 = "repos" ]]; then
  helm repo add elastic https://helm.elastic.co
  helm repo add fluent https://fluent.github.io/helm-charts
  helm repo add grafana https://grafana.github.io/helm-charts
  helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
  helm repo add kiali https://kiali.org/helm-charts
  helm repo add kube-state-metrics https://kubernetes.github.io/kube-state-metrics
  helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm repo update
  exit 0
fi

echo "please specify action ./charts.sh package/upload/index/repos"
exit 1