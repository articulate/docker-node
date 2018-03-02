# Articulate Node Images

Base node image which contains common dependencies used in our organization.

These are all built on Dockerhub as Automated Builds.

## To test locally

1. Run `make` to build a `local/articulate-node` image locally
2. Change the first line of your `Dockerfile` to be:

```
FROM local/articulate-node
```

3. Then

```
docker-compose build --no-cache && docker-compose up
```
