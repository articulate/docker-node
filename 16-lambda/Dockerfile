FROM amazon/aws-lambda-nodejs:16

ENV AWS_DEFAULT_REGION us-east-1
ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV SHELL bash

ENV AWS_SDK_VERSION 2.585.0
ENV YARN_VERSION 1.22.15

COPY entrypoint-lambda.sh /
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh

RUN yum -y install shadow-utils make zip && yum clean all \
    && npm install -g npm@7 \
    && npm install -g \
        aws-sdk@$AWS_SDK_VERSION \
        yarn@$YARN_VERSION \
    && bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh \
    && chmod a+rx /wait-for-it.sh \
    && /usr/sbin/groupadd $SERVICE_USER && /usr/sbin/useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER

WORKDIR $SERVICE_ROOT

ENTRYPOINT ["/entrypoint-lambda.sh"]
