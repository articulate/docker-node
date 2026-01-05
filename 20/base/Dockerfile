# tags=articulate/node:20
# syntax=docker/dockerfile:1
FROM node:20-bookworm-slim

ENV SERVICE_ROOT=/service SERVICE_USER=service SERVICE_UID=1001 NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/aws-rds-global-bundle.pem

ARG TARGETARCH

ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/install_packages /usr/local/bin/install_packages
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/awscli.sh /tmp/awscli.sh
# Add AWS RDS CA trusted root certificates for node
ADD --chmod=644 https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem /usr/local/share/ca-certificates/aws-rds-global-bundle.pem

RUN install_packages make dumb-init ca-certificates && /tmp/awscli.sh && rm /tmp/awscli.sh \
    # Create our own user and remove the node user
    && groupadd --gid $SERVICE_UID $SERVICE_USER \
    && useradd --create-home --shell /bin/bash --gid $SERVICE_UID --uid $SERVICE_UID $SERVICE_USER \
    && userdel -r node \
    # Split PEM bundle into individual cert files for update-ca-certificates
    && csplit -s -z -n 3 -f /usr/local/share/ca-certificates/aws-rds-ca- \
      /usr/local/share/ca-certificates/aws-rds-global-bundle.pem  \
      '/-----BEGIN CERTIFICATE-----/' '{*}' \
    && for f in /usr/local/share/ca-certificates/aws-rds-ca-*; do mv "$f" "$f.crt"; done \
    && update-ca-certificates

ADD --chmod=755 https://github.com/articulate/docker-bootstrap/releases/latest/download/docker-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/docker-secrets /usr/local/bin/secrets
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh

USER $SERVICE_USER
WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault,
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-bootstrap
ENTRYPOINT [ "dumb-init", "--", "/entrypoint" ]
