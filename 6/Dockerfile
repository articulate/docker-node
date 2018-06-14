FROM node:6-stretch

ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV NPM_VER 6.1.0

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

RUN npm uninstall npm -g

RUN wget https://registry.npmjs.org/npm/-/npm-${NPM_VER}.tgz \
  && tar xzf npm-${NPM_VER}.tgz \
  && ./package/scripts/install.sh

RUN yarn global add node-gyp

ENTRYPOINT ["/entrypoint.sh"]
