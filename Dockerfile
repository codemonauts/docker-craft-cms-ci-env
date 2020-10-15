FROM ubuntu:focal

ENV NODE_VERSION "12"
ENV NVM_VERSION "v0.35.2"
ENV NVM_DIR /root/.nvm
LABEL MAINTAINER felix@codemonauts.com

# Install andrej ppa for modern PHP versions
RUN apt-get update &&\
    apt-get install -y --no-install-recommends software-properties-common &&\
    add-apt-repository ppa:ondrej/php &&\
    apt-get update

RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN apt-get install -y --no-install-recommends \
    apt-transport-https \ 
    ca-certificates \
    curl \
    git \
    gnupg \
    php7.4-cli \
    php7.4-zip \
    python2-minimal \
    unzip \
    zip &&\
    rm -rf /var/lib/apt/lists

# Install composer
RUN cd /tmp &&\
    curl --silent --show-error https://getcomposer.org/installer | php &&\
    mv composer.phar /usr/local/bin/composer

# Install NodeJS
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - &&\
    echo 'deb https://deb.nodesource.com/node_12.x focal main' > /etc/apt/sources.list.d/nodesource.list &&\
    apt-get update &&\
    apt-get install -y nodejs

# Install gulp
RUN npm install -g gulp
