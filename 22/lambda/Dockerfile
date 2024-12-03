# tags=articulate/node:22-lambda
# syntax=docker/dockerfile:1
FROM amazon/aws-lambda-nodejs:22

ENV AWS_DEFAULT_REGION us-east-1
ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV SERVICE_UID 1001

ARG TARGETARCH

RUN dnf -y install make zip shadow-utils \
    # Add service user
    && /usr/sbin/groupadd --gid $SERVICE_UID $SERVICE_USER \
    && /usr/sbin/useradd --create-home --shell /bin/bash --uid $SERVICE_UID --gid $SERVICE_UID $SERVICE_USER \
    # Install yarn
    && npm install --global yarn@1.22.19 \
    # clean up
    && dnf -y remove shadow-utils \
    && dnf clean all \
    && npm cache clean --force

ADD --chmod=755 https://github.com/articulate/docker-bootstrap/releases/latest/download/docker-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/docker-secrets /usr/local/bin/secrets

USER $SERVICE_USER
WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault,
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-bootstrap
ENTRYPOINT [ "/entrypoint" ]

