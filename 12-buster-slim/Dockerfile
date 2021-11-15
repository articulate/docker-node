FROM node:12-buster-slim

ENV SERVICE_ROOT /service
ENV SERVICE_USER service
ENV NODE_MODULES_PATH /node_modules
ENV PATH $PATH:$NODE_MODULES_PATH/.bin

ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh

RUN apt-get update -qq \
        && apt-get upgrade -y \
        && apt-get install -y --no-install-recommends \
            build-essential python3 imagemagick \
        && apt-get upgrade -y \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
    && bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh \
    && chmod a+rx /wait-for-it.sh \
    # Create our own user and remove the node user
    && groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER \
    && userdel -r node \
    # Install the latest version of npm
    && npm install -g npm@latest \
    # Create the node_modules directory, make it owned by service user
    && mkdir -p $NODE_MODULES_PATH && chown $SERVICE_USER:$SERVICE_USER $NODE_MODULES_PATH

# Add a strict security policy for Imagemagick (note: Imagemagick 7 is currently not available in Debian)
COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

WORKDIR $SERVICE_ROOT

# Our entrypoint will pull in our environment variables from Consul and Vault,
# and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap/blob/master/entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
