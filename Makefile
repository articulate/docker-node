default: build_6 build_8

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

build_10-alpine:
	docker build -t local/articulate-node:10-alpine 10-alpine/
