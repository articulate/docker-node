all: lambda stretch-slim buster-slim bullseye-slim

lambda: 12-lambda 14-lambda 16-lambda

stretch-slim: 12-stretch-slim 14-stretch-slim 16-stretch-slim

buster-slim: 12-buster-slim 14-buster-slim 16-buster-slim

bullseye-slim: 16-bullseye-slim 18-bullseye-slim

.PHONY: all lambda stretch-slim buster-slim

12-lambda:
	docker build -t local/articulate-node:12-lambda -f 12-lambda/Dockerfile .
.PHONY: 12-lambda

14-lambda:
	docker build -t local/articulate-node:14-lambda -f 14-lambda/Dockerfile .
.PHONY: 14-lambda

16-lambda:
	docker build -t local/articulate-node:16-lambda -f 16-lambda/Dockerfile .
.PHONY: 16-lambda

12-stretch-slim:
	docker build -t local/articulate-node:12-stretch-slim -f 12-stretch-slim/Dockerfile .
.PHONY: 12-stretch-slim

14-stretch-slim:
	docker build -t local/articulate-node:14-stretch-slim -f 14-stretch-slim/Dockerfile .
.PHONY: 14-stretch-slim

16-stretch-slim:
	docker build -t local/articulate-node:16-stretch-slim -f 16-stretch-slim/Dockerfile .
.PHONY: 16-stretch-slim

12-buster-slim:
	docker build -t local/articulate-node:12-buster-slim -f 12-buster-slim/Dockerfile .
.PHONY: 12-buster-slim

14-buster-slim:
	docker build -t local/articulate-node:14-buster-slim -f 14-buster-slim/Dockerfile .
.PHONY: 14-buster-slim

16-buster-slim:
	docker build -t local/articulate-node:16-buster-slim -f 16-buster-slim/Dockerfile .
.PHONY: 16-buster-slim

16-bullseye-slim:
	docker build -t local/articulate-node:16-bullseye-slim -f 16-bullseye-slim/Dockerfile .
.PHONY: 16-bullseye-slim

18-bullseye-slim:
	docker build -t local/articulate-node:18-bullseye-slim -f 18-bullseye-slim/Dockerfile .
.PHONY: 18-bullseye-slim
