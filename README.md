# Articulate Node Images

Base Node.js image that contains common dependencies used in our organization.

## To test locally

1. Run `make` to build a `local/articulate-node` image locally
2. Change the first line of your `Dockerfile` to be:

```dockerfile
FROM local/articulate-node
```

3. Then

```shell
docker-compose build --no-cache && docker-compose up
```
