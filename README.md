# Docker Node Images

Base Node.js Docker images.

## What's Included

* [docker-bootstrap](https://github.com/articulate/docker-bootstrap) entrypoint
  for loading environment variables from Consul and Vault.
* [secrets](https://github.com/articulate/docker-bootstrap/blob/main/scripts/docker-secrets)
  to load Docker secrets as environment variables.
* [install_packages](https://github.com/articulate/docker-bootstrap/blob/main/scripts/install_packages)
  to install apt packages.
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
  for interacting with AWS services.

## Tags

> 🌟 recommended image

* __articulate/node:22__ 🌟
* articulate/node:22-lambda
* __articulate/node:20__ 🌟
* articulate/node:20-lambda
* articulate/node:18
* articulate/node:18-lambda
* articulate/articulate-node:18-bullseye-slim
* articulate/articulate-node:18-lambda

### articulate/node vs articulate/articulate-node

`articulate/articulate-node` are the legacy Docker images. Those ran as root and
include software not always needed. Use `articulate/node` where possible and
install your own software with `install_packages`.

## Creating a new image

The easiest way to create a new image is to copy an existing one and change the
base image. If creating from scratch, the images need the following:

* Everything listed in [What's included](#whats-included)
* `make` for internal tooling.
* A _service_ user and group with a GID and UID of 1001. This should be the default
  user.
* A _/service_ directory as the default working directory.
