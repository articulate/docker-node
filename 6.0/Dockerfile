FROM node:6.0
COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

RUN npm install -g yarn
ENV PATH="${PATH}:${HOME}/.yarn/bin"

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

ENTRYPOINT ["/entrypoint.sh"]
