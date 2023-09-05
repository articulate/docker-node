help:
	@echo "+ $@"
	@grep -Eh '(^[a-zA-Z0-9\._-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m## /[33m/'
.PHONY: help

14-buster-slim: ## Build articulate/articulate-node:14-buster-slim
	docker build -t articulate/articulate-node:14-buster-slim 14-buster-slim
.PHONY: 14-buster-slim

14-lambda: ## Build articulate/articulate-node:14-lambda
	docker build -t articulate/articulate-node:14-lambda 14-lambda
.PHONY: 14-lambda

16-bullseye-slim: ## Build articulate/articulate-node:16-bullseye-slim
	docker build -t articulate/articulate-node:16-bullseye-slim 16-bullseye-slim
.PHONY: 16-bullseye-slim

16-buster-slim: ## Build articulate/articulate-node:16-buster-slim
	docker build -t articulate/articulate-node:16-buster-slim 16-buster-slim
.PHONY: 16-buster-slim

16-lambda: ## Build articulate/articulate-node:16-lambda
	docker build -t articulate/articulate-node:16-lambda 16-lambda
.PHONY: 16-lambda

18-bullseye-slim: ## Build articulate/articulate-node:18-bullseye-slim
	docker build -t articulate/articulate-node:18-bullseye-slim 18-bullseye-slim
.PHONY: 18-bullseye-slim

18-lambda: ## Build articulate/articulate-node:18-lambda
	docker build -t articulate/articulate-node:18-lambda 18-lambda
.PHONY: 18-lambda

20-bullseye-slim: ## Build articulate/articulate-node:20-bullseye-slim
	docker build -t articulate/articulate-node:20-bullseye-slim 20-bullseye-slim
.PHONY: 20-bullseye-slim
