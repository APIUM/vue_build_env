# Base of this file is from:
#   https://github.com/cypress-io/cypress-docker-images/blob/master/base/ubuntu19-node12.14.1/Dockerfile
# 
#

FROM ubuntu:20.04

RUN apt-get update && \
  apt-get install -y apt-transport-https curl

RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs

# Install latest NPM and Yarn
RUN npm install -g npm@6.13.6
RUN npm install -g yarn@1.12.1

# install additional native dependencies build tools
RUN apt install -y build-essential

# install Git
RUN apt-get install -y git
# install unzip utility to speed up Cypress unzips
# https://github.com/cypress-io/cypress/releases/tag/v3.8.0
RUN apt-get install -y unzip

# avoid any prompts
ENV DEBIAN_FRONTEND noninteractive

# install Cypress dependencies (separate commands to avoid time outs)
RUN apt-get install -y \
    libgtk2.0-0
RUN apt-get install -y \
    libnotify-dev
RUN apt-get install -y \
    libgconf-2-4 \
    libnss3 \
    libxss1
RUN apt-get install -y \
    libasound2 \
    xvfb

# Create user to map
ENV user builder
RUN useradd -m -d /home/${user} -s /bin/bash --uid 1000 --user-group ${user} \
  && chown -R ${user}:${user} /home/${user}

# a few environment variables to make NPM installs easier
# good colors for most applications
ENV TERM xterm
# avoid million NPM install messages
ENV npm_config_loglevel warn
# allow installing when the main user is root
ENV npm_config_unsafe_perm true

# versions of local tools
RUN echo  " node version:    $(node -v) \n" \
  "npm version:     $(npm -v) \n" \
  "yarn version:    $(yarn -v) \n" \
  "debian version:  $(cat /etc/debian_version) \n" \
  "user:            $(whoami) \n" \
  "git:             $(git --version) \n"

RUN echo "More version info"
RUN cat /etc/lsb-release
RUN cat /etc/os-release

USER ${user}

RUN yarn global add @vue/cli
RUN PATH=$PATH:~/.yarn/bin
RUN mkdir -p /app/node_modules
RUN chown builder:builder /app/node_modules

WORKDIR /app
