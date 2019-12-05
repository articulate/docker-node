default: build_6 build_8

alpine: build_6-alpine build_8-alpine build_10-alpine

lambda: build_8-lambda build_10-lambda build_12-lambda

stretch-slim: build_8-stretch-slim build_10-stretch-slim build_12-stretch-slim

build_6:
	docker build -t local/articulate-node:6 6/

build_6-alpine:
	docker build -t local/articulate-node:6-alpine 6-alpine/

build_8:
	docker build -t local/articulate-node:8 8/

build_8-alpine:
	docker build -t local/articulate-node:8-alpine 8-alpine/

build_8-lambda:
	docker build -t local/articulate-node:8-lambda 8-lambda/

build_8-stretch-slim:
	docker build -t local/articulate-node:8-stretch-slim 8-stretch-slim/

build_10-alpine:
	docker build -t local/articulate-node:10-alpine 10-alpine/

build_10-lambda:
	docker build -t local/articulate-node:10-lambda 10-lambda/

build_12-lambda:
	docker build -t local/articulate-node:12-lambda 12-lambda/

build_10-stretch-slim:
	docker build -t local/articulate-node:10-stretch-slim 10-stretch-slim/

build_12-stretch-slim:
	docker build -t local/articulate-node:12-stretch-slim 12-stretch-slim/
