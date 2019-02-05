# Debian-based image maintained by by Node, see https://hub.docker.com/_/node/ for a full list of available images.
# Source for this base image can be found at https://github.com/nodejs/docker-node/tree/master/8/stretch-slim
FROM node:8-stretch-slim

# Run apt-get, be vewwy quiet (-qq) and say yes to prompts (-y)
# See best practices for apt-get in Docker at https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
# We also install the things we need across the organisation, and which we want to 'manage' centrally.
RUN apt-get update -qq && apt-get upgrade -y && apt-get install -y build-essential imagemagick

# Install consul-template, which we'll use to pull in our environment variables
# If you want to know more on this, see the Platform 101 course, section "Consul and Vault"
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/install.sh /tmp/consul_template_install.sh
RUN bash /tmp/consul_template_install.sh && rm /tmp/consul_template_install.sh

# Create our group and user
ENV SERVICE_ROOT /service
ENV SERVICE_USER service
RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT

# Remove the 'node' user. It's available by default but we don't need it.
# https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md#non-root-user
RUN userdel -r node

# Make the wait-for-it script available to all projects.
# This is sometimes used by projects to make sure that supporting containers are up before the app starts.
# As an example, see the Makefile in the Heroes project.
ADD https://raw.githubusercontent.com/articulate/docker-consul-template-bootstrap/master/wait-for-it.sh /wait-for-it.sh
RUN chmod a+rx /wait-for-it.sh

# Install the latest version of npm (which apparently the node base image doesn't necessarily provide)
RUN npm install npm -g

# Make node-gyp globally available (used for compiling native modules for Node.js)
# https://github.com/nodejs/node-gyp
RUN yarn global add node-gyp

# Add a strict security policy for Imagemagick (note: Imagemagick 7 is currently not available in Debian)
COPY imagemagick-policy.xml /etc/ImageMagick-6/policy.xml

# Our entrypoint will pull in our environment variables from Consul and Vault, and execute whatever command we provided the container.
# See https://github.com/articulate/docker-consul-template-bootstrap/blob/master/entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
