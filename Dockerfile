FROM ubuntu:xenial

ENV NODE_VERSION "12"
ENV NVM_VERSION "v0.35.2"
ENV NVM_DIR /root/.nvm
LABEL MAINTAINER felix@codemonauts.com

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    apt-transport-https \ 
    ca-certificates \
    curl \
    git \
    php7.0-cli \
    php7.0-zip \
    unzip \
    zip &&\
    rm -rf /var/lib/apt/lists

# Install composer
RUN cd /tmp &&\
    curl --silent --show-error https://getcomposer.org/installer | php &&\
    mv composer.phar /usr/local/bin/composer

# Install NodeJS
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - &&\
    echo 'deb https://deb.nodesource.com/node_12.x bionic main' > /etc/apt/sources.list.d/nodesource.list &&\
    apt-get update &&\
    apt-get install -y nodejs

# Install gulp
RUN npm install -g gulp
