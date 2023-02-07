# syntax=docker/dockerfile:1
FROM amazon/aws-lambda-nodejs:16

ENV AWS_DEFAULT_REGION us-east-1
ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV SHELL bash

ENV AWS_SDK_VERSION 2.585.0
ENV YARN_VERSION 1.22.15

ARG TARGETARCH
ARG AWSCLI_VERSION=2.9.15
ADD --chmod=755 https://github.com/articulate/docker-consul-template-bootstrap/releases/latest/download/docker-consul-template-bootstrap_linux_${TARGETARCH} /entrypoint
ADD --chmod=755 https://raw.githubusercontent.com/vishnubob/wait-for-it/81b1373f17855a4dc21156cfe1694c31d7d1792e/wait-for-it.sh /wait-for-it.sh
COPY entrypoint-lambda.sh /

RUN npm install -g npm@7 \
    && npm install -g \
        aws-sdk@$AWS_SDK_VERSION \
        yarn@$YARN_VERSION \
    && yum -y install \
        shadow-utils make zip \
        # TODO: these packages will be removed in an upcoming release.
        unzip jq sudo wget curl which \
    && yum clean all \
    && rm -rf /var/cache/yum \
    && /usr/sbin/groupadd $SERVICE_USER && /usr/sbin/useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER \
    && ln -s /entrypoint /entrypoint.sh \
    # AWSCLI (to be removed in a future release)
    && curl -s "https://awscli.amazonaws.com/awscli-exe-linux-$(uname -m)-${AWSCLI_VERSION}.zip" -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    && rm -rf /tmp/aws /tmp/awscliv2 /tmp/awscliv2.zip

WORKDIR $SERVICE_ROOT

ENTRYPOINT [ "/entrypoint-lambda.sh", "/entrypoint" ]
