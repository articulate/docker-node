FROM lambci/lambda:build-nodejs8.10

ENV AWS_DEFAULT_REGION us-east-1
ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV SHELL bash

ENV AWS_SDK_VERSION 2.290.0
ENV YARN_VERSION 1.17.3

RUN npm i -g \
  aws-sdk@$AWS_SDK_VERSION \
  node-gyp \
  yarn@$YARN_VERSION

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

COPY entrypoint-lambda.sh /
ENTRYPOINT ["/entrypoint-lambda.sh"]
