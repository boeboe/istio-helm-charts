# Istio Helm Charts

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/helm)](https://artifacthub.io/packages/search?repo=helm)

The code is provided as-is with no warranties.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.
Please refer to Helm's [documentation](https://helm.sh/docs/) to get started.

Once Helm is set up properly, add the repo as follows:

```console
helm repo add istio https://boeboe.github.io/istio-helm-charts
```

You can then run `helm search repo istio` to see the charts.

```console
helm search repo istio
NAME                    CHART VERSION   APP VERSION     DESCRIPTION                                       
istio/istio-cni         1.1.0                           Helm chart for istio-cni components               
istio/istio-discovery   1.2.0                           Helm chart for istio control plane                
istio/istio-egress      1.1.0                           Helm chart for deploying Istio gateways           
istio/istio-ingress     1.1.0                           Helm chart for deploying Istio gateways           
istio/istio-operator    1.7.0                           Helm chart for deploying Istio operator           
istio/istiod-remote     1.2.0                           Helm chart for a remote cluster using an extern...
istio/base              1.1.0                           Helm chart for deploying Istio cluster resource...
```

### Charts

This is a list of available charts.

|Chart|Release|Docs|Values|Description|
|-----|-------|----|------|-----------|
|base|[1.1.0](https://github.com/boeboe/istio-helm-charts/releases/tag/base-1.1.0)|[doc](charts/istio/base/NOTES.txt)|[yaml](charts/istio/base/values.yaml)|Helm chart for deploying Istio cluster resources and CRDs|
|istio-cni|[1.1.0](https://github.com/boeboe/istio-helm-charts/releases/tag/istio-cni-1.1.0)|[doc](charts/istio/istio-cni/NOTES.txt)|[yaml](charts/istio/istio-cni/values.yaml)|Helm chart for istio-cni components|
|istio-discovery|[1.2.0](https://github.com/boeboe/istio-helm-charts/releases/tag/istio-discovery-1.2.0)|[doc](charts/istio/istio-control/istio-discovery/NOTES.txt)|[yaml](charts/istio/istio-control/istio-discovery/values.yaml)|Helm chart for istio control plane|
|istio-egress|[1.1.0](https://github.com/boeboe/istio-helm-charts/releases/tag/istio-egress-1.1.0)|[doc](charts/istio/gateways/istio-egress/NOTES.txt)|[yaml](charts/istio//gateways/istio-egress/values.yaml)|Helm chart for deploying Istio egress gateways|
|istio-ingress|[1.1.0](https://github.com/boeboe/istio-helm-charts/releases/tag/istio-ingress-1.1.0)|[doc](charts/istio/gateways/istio-ingress/NOTES.txt)|[yaml](charts/istio//gateways/istio-ingress/values.yaml)|Helm chart for deploying Istio ingress gateways|
|istio-operator|[1.7.0](https://github.com/boeboe/istio-helm-charts/releases/tag/istio-operator-1.7.0)|[doc](charts/istio/istio-operator/NOTES.txt)|[yaml](charts/istio/istio-operator/values.yaml)|Helm chart for deploying Istio operator|
|istiod-remote|[1.2.0](https://github.com/boeboe/istio-helm-charts/releases/tag/istiod-remote-1.2.0)|[doc](charts/istio/istiod-remote/NOTES.txt)|[yaml](charts/istio/istiod-remote/values.yaml)|Helm chart for a remote cluster using an external istio control plane|

## License

<!-- Keep full URL links to repo files because this README syncs from main to gh-pages.  -->
[Apache 2.0 License](https://github.com/boeboe/istio-helm-charts/blob/main/LICENSE).