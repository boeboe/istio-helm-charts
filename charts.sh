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
  exit 0
fi

if [[ $1 = "upload" ]]; then
  echo "What is your github token? "
  read -r GITHUB_TOKEN
  cr upload --owner ${OWNER} --git-repo ${GITHUB_REPO} --token ${GITHUB_TOKEN}
  exit 0
fi

if [[ $1 = "index" ]]; then
  echo "What is your github token? "
  read -r GITHUB_TOKEN
  cr index --owner ${OWNER} --git-repo ${GITHUB_REPO} --charts-repo ${CHARTS_REPO} --token ${GITHUB_TOKEN}
  mv .cr-index/index.yaml .
  exit 0
fi

echo "please specify action ./charts.sh package/upload/index"
exit 1