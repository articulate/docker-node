all: lambda stretch-slim

lambda: build_10-lambda build_12-lambda build_14-lambda

stretch-slim: build_10-stretch-slim build_12-stretch-slim build_14-stretch-slim

build_10-lambda:
	docker build -t local/articulate-node:10-lambda 10-lambda/

build_12-lambda:
	docker build -t local/articulate-node:12-lambda 12-lambda/

build_14-lambda:
	docker build -t local/articulate-node:14-lambda 14-lambda/

build_10-stretch-slim:
	docker build -t local/articulate-node:10-stretch-slim 10-stretch-slim/

build_12-stretch-slim:
	docker build -t local/articulate-node:12-stretch-slim 12-stretch-slim/

build_14-stretch-slim:
	docker build -t local/articulate-node:14-stretch-slim 14-stretch-slim/
