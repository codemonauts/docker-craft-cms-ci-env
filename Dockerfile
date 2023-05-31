FROM ubuntu:jammy

ENV NODE_VERSION "node_18.x"
ENV DISTRO "jammy"
ENV COMPOSER_VERSION "2.5.5"

LABEL MAINTAINER felix@codemonauts.com

# Install andrej ppa for modern PHP versions
RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    software-properties-common \
    gnupg \
    gnupg-agent &&\
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php &&\
    rm -rf /var/lib/apt/lists

RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

RUN apt-get update &&\
    apt-get install -y --no-install-recommends \
    apt-transport-https \ 
    ca-certificates \
    curl \
    git \
    php8.1-cli \
    php8.1-zip \
    python2-minimal \
    unzip \
    wget \
    zip &&\
    rm -rf /var/lib/apt/lists

# Get Composer
RUN wget "https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar" -O /usr/local/bin/composer &&\
    chmod +x /usr/local/bin/composer

# Install NodeJS
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - &&\
    echo "deb https://deb.nodesource.com/$NODE_VERSION $DISTRO main" > /etc/apt/sources.list.d/nodesource.list &&\
    apt-get update &&\
    apt-get install -y nodejs &&\
    rm -rf /var/lib/apt/lists
