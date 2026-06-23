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
* [AWS RDS CA Certificates](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/UsingWithRDS.SSL.html)
  to enable trusted TLS connections with AWS RDS instances _(in any region)_.

## Tags

> 🌟 recommended image

* __articulate/node:24__ 🌟
* articulate/node:24-lambda
* __articulate/node:22__ 🌟
* articulate/node:22-lambda
* __articulate/node:20__
* articulate/node:20-lambda

### Upstream Node pin (June 23 2026)

Node 22 and 24 base images are temporarily pinned to pre-regression versions:

* `node:22` → `node:22.22-bookworm-slim`
* `node:22-lambda` → `amazon/aws-lambda-nodejs:22.2026.05.05.20-x86_64`
* `node:24` → `node:24.16-bookworm-slim`
* `node:24-lambda` → `public.ecr.aws/lambda/nodejs:24.2026.05.05.20`

Node 22.23.0 and 24.17.0 (2026-06-18 security release for CVE-2026-48931)
regressed `http.Agent` keep-alive handling, breaking `node-fetch@2` (and the
entire `gaxios` → `googleapis` / `@google-cloud` / `firebase-tools` stack) with
`ERR_STREAM_PREMATURE_CLOSE` under load. Unpin once 22.23.1+/22.24.0 and
24.17.1+/24.18.0 ship.

* Issue: <https://github.com/nodejs/node/issues/63989>
* Fix PR: <https://github.com/nodejs/node/pull/64004>

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
