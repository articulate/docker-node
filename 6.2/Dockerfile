FROM node:6.2

RUN npm install -g yarn@0.19.1
ENV PATH="${PATH}:${HOME}/.yarn/bin"

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

ENTRYPOINT ["/entrypoint.sh"]
