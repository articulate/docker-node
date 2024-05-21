# tags=articulate/node:18
# syntax=docker/dockerfile:1
FROM node:18-bullseye-slim

ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV SERVICE_UID 1001

ARG TARGETARCH

ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/install_packages /usr/local/bin/install_packages
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/awscli.sh /tmp/awscli.sh

RUN install_packages make dumb-init && /tmp/awscli.sh && rm /tmp/awscli.sh \
    # Create our own user and remove the node user
    && groupadd --gid $SERVICE_UID $SERVICE_USER \
    && useradd --create-home --shell /bin/bash --gid $SERVICE_UID --uid $SERVICE_UID $SERVICE_USER \
    && userdel -r node

ADD --chmod=755 https://github.com/articulate/docker-bootstrap/releases/latest/download/docker-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/docker-secrets /usr/local/bin/secrets
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh

USER $SERVICE_USER
WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault,
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-bootstrap
ENTRYPOINT [ "dumb-init", "--", "/entrypoint" ]
