FROM amazonlinux:2017.03.1.20170812

ENV NODE_VERSION 8.10.0
ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV YARN_VERSION 1.6.0

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - && \
    yum install -y nodejs-$NODE_VERSION

RUN curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | tee /etc/yum.repos.d/yarn.repo && \
    yum install -y yarn-$YARN_VERSION

RUN yarn global add \
      aws-sdk@2.221.1 \
      node-gyp \
      nodemon

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

## TODO: ask platform if this is needed
# RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

## TODO: need to `yarn link aws-sdk` in an entrypoint file (post build)
ENTRYPOINT ["/entrypoint.sh"]
