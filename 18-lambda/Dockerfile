# syntax=docker/dockerfile:1
FROM amazon/aws-lambda-nodejs:18

ENV AWS_DEFAULT_REGION us-east-1

ARG TARGETARCH
ADD --chmod=755 https://github.com/articulate/docker-consul-template-bootstrap/releases/latest/download/docker-consul-template-bootstrap_linux_${TARGETARCH} /entrypoint

RUN yum -y install make zip \
    && yum clean all \
    && rm -rf /var/cache/yum

ENTRYPOINT [ "/entrypoint" ]
