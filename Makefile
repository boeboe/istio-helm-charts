# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help package upload index

help: ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help


package:  ## Package Helm charts
	./charts.sh package

upload: ## Upload Helm chart packages to GitHub Release
	./charts.sh upload

index: ## Update Helm repo index.yaml for the given GitHub repo
	./charts.sh index
