# Articulate Node Images

Base Node.js image that contains common dependencies used in our organization.

## Adding an image

1. Create directory for image
2. Add Dockerfile and any related policies to directory
3. Update the Makefile: [Example](https://github.com/articulate/docker-articulate-node/pull/70/commits/3d58f80b8be0da9edcd1e38d5ffe600186199ac9#diff-76ed074a9305c04054cdebb9e9aad2d818052b07091de1f20cad0bbac34ffb52R33)
4. Add the image to the Github Action workflow [Matrix](https://github.com/articulate/docker-articulate-node/blob/809aec98a0d99cdcb214662725a32e56b76dfb50/.github/workflows/build.yml#L16) - this will build the image and add to DockerHub.


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
