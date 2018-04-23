default: build_4 build_6 build_8

build_4:
	docker build -t local/articulate-node:4 4/

build_6:
	docker build -t local/articulate-node:6 6/

build_6-alpine:
	docker build -t local/articulate-node:6-alpine 6-alpine/

build_8:
	docker build -t local/articulate-node:8 8/

build_8-alpine:
	docker build -t local/articulate-node:8-alpine 8-alpine/
