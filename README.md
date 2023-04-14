# Articulate Node Images

Base Node.js image that contains common dependencies used in our organization.

```dockerfile
FROM articulate/articulate-node:<tag>
```

## Tags

> 🌟 recommended image

* __18-bullseye-slim__ 🌟
* __18-lambda__ 🌟
* __16-bullseye-slim__ 🌟
* __16-lambda__ 🌟
* 16-buster-slim
* 16-stretch-slim
* 14-buster-slim
* 14-stretch-slim
* 14-lambda
* 12-buster-slim
* 12-stretch-slim
* 12-lambda

## Adding an image

1. Create directory for image
2. Add Dockerfile and any related policies to the directory
3. Add a Makefile [target](https://github.com/articulate/docker-articulate-node/blob/02fe1df76dddcc5f6482e954cf3ff0ca814ab4ab/Makefile#L53),
  including any [categories](https://github.com/articulate/docker-articulate-node/blob/02fe1df76dddcc5f6482e954cf3ff0ca814ab4ab/Makefile#L9).
4. Add the image to the [build](https://github.com/articulate/docker-articulate-node/blob/02fe1df76dddcc5f6482e954cf3ff0ca814ab4ab/.github/workflows/build.yml#L26)
  and [lint](https://github.com/articulate/docker-articulate-node/blob/02fe1df76dddcc5f6482e954cf3ff0ca814ab4ab/.github/workflows/lint.yml#L12)
  workflows.

## Testing Locally

1. Run `make` to build a `articulate/articulate-node` image locally
2. Run `docker compose build --no-cache`
3. Run docker-compose as normal `docker compose up`
