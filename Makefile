all: lambda stretch-slim buster-slim bullseye-slim

lambda: 12-lambda 14-lambda 16-lambda 18-lambda

stretch-slim: 12-stretch-slim 14-stretch-slim 16-stretch-slim

buster-slim: 12-buster-slim 14-buster-slim 16-buster-slim

bullseye-slim: 16-bullseye-slim 18-bullseye-slim

.PHONY: all lambda stretch-slim buster-slim

12-lambda:
	docker build -t local/articulate-node:12-lambda 12-lambda
.PHONY: 12-lambda

14-lambda:
	docker build -t local/articulate-node:14-lambda 14-lambda
.PHONY: 14-lambda

16-lambda:
	docker build -t local/articulate-node:16-lambda 16-lambda
.PHONY: 16-lambda

12-stretch-slim:
	docker build -t local/articulate-node:12-stretch-slim 12-stretch-slim
.PHONY: 12-stretch-slim

14-stretch-slim:
	docker build -t local/articulate-node:14-stretch-slim 14-stretch-slim
.PHONY: 14-stretch-slim

16-stretch-slim:
	docker build -t local/articulate-node:16-stretch-slim 16-stretch-slim
.PHONY: 16-stretch-slim

12-buster-slim:
	docker build -t local/articulate-node:12-buster-slim 12-buster-slim
.PHONY: 12-buster-slim

14-buster-slim:
	docker build -t local/articulate-node:14-buster-slim 14-buster-slim
.PHONY: 14-buster-slim

16-buster-slim:
	docker build -t local/articulate-node:16-buster-slim 16-buster-slim
.PHONY: 16-buster-slim

16-bullseye-slim:
	docker build -t local/articulate-node:16-bullseye-slim 16-bullseye-slim
.PHONY: 16-bullseye-slim

18-bullseye-slim:
	docker build -t local/articulate-node:18-bullseye-slim 18-bullseye-slim
.PHONY: 18-bullseye-slim

18-lambda:
	docker build -t local/articulate-node:18-lambda 18-lambda
.PHONY: 18-lambda
