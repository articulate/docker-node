# syntax=docker/dockerfile:1
FROM node:18-bullseye-slim

ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV NODE_MODULES_PATH /node_modules
ENV PATH $PATH:$NODE_MODULES_PATH/.bin

ARG TARGETARCH
ARG AWSCLI_VERSION=2.9.15
ADD --chmod=755 https://github.com/articulate/docker-consul-template-bootstrap/releases/latest/download/docker-consul-template-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/main/scripts/docker-secrets /usr/local/bin/secrets
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh

RUN apt-get update -qq \
        && apt-get upgrade -y \
        && apt-get install -y --no-install-recommends \
            build-essential python3 imagemagick retry \
            # TODO: these packages will be removed in an upcoming release.
            # If you want them, please copy to your Dockerfile
            unzip sudo jq wget curl ca-certificates \
        && apt-get upgrade -y \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
    && ln -s /entrypoint /entrypoint.sh \
    # AWSCLI (to be removed in a future release)
    && curl -s "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m)-${AWSCLI_VERSION}.zip" -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2 /tmp/awscliv2.zip \
    # Create our own user and remove the node user
    && groupadd --gid 1001 $SERVICE_USER \
    && useradd --create-home --home $SERVICE_ROOT --shell /bin/bash --gid 1001 --uid 1001 $SERVICE_USER \
    && userdel -r node \
    # Install the latest version of npm
    && npm install -g npm@latest \
    # Create the node_modules directory, make it owned by service user
    && mkdir -p $NODE_MODULES_PATH && chown $SERVICE_USER:$SERVICE_USER $NODE_MODULES_PATH

# Add a strict security policy for Imagemagick (note: Imagemagick 7 is currently not available in Debian)
COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault,
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap
ENTRYPOINT [ "/entrypoint" ]
