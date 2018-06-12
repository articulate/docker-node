FROM node:8-alpine

RUN npm uninstall npm -g

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

RUN apk add --no-cache bash make gcc g++ binutils jq sudo unzip 

RUN apk upgrade --no-cache binutils jq sudo unzip

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

RUN addgroup $SERVICE_USER && adduser -h $SERVICE_ROOT -G $SERVICE_USER -s /bin/bash $SERVICE_USER -D
WORKDIR $SERVICE_ROOT

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

RUN yarn global add node-gyp

ENTRYPOINT ["/entrypoint.sh"]
