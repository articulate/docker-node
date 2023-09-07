# tags=articulate/articulate-node:18-lambda
# syntax=docker/dockerfile:1
FROM amazon/aws-lambda-nodejs:18

ENV AWS_DEFAULT_REGION us-east-1

ARG TARGETARCH
ADD --chmod=755 https://github.com/articulate/docker-bootstrap/releases/latest/download/docker-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/articulate/docker-bootstrap/main/scripts/docker-secrets /usr/local/bin/secrets

RUN yum -y install make zip \
    && yum clean all \
    && rm -rf /var/cache/yum

ENTRYPOINT [ "/entrypoint" ]
