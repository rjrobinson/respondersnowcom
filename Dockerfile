FROM circleci/ruby:2.6.3-node
MAINTAINER RJ Robinson <robertj.robinson@gmail.com>

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get install -y apt-transport-https
RUN sudo apt-get update -qq && sudo apt-get install -y build-essential postgresql libpq-dev shared-mime-info nodejs
RUN sudo apt-get install -y software-properties-common gcc g++ make libqt5webkit5-dev ruby-dev zlib1g-dev yarn

# for nokogiri
RUN sudo apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
RUN sudo apt-get install -y libqt5webkit5-dev xvfb
RUN sudo apt-get install -y build-essential libgl1-mesa-dev qt5-default

RUN sudo sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    sudo locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#install FREETDS
RUN sudo apt-get update && sudo apt-get install -y freetds-bin freetds-dev freetds-common libct4 libsybdb5 tdsodbc libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libldap2-dev zlib1g-dev libc-client-dev

RUN sudo apt-get install wget
RUN sudo apt-get install build-essential
RUN sudo apt-get install libc6-dev
RUN sudo wget ftp://ftp.freetds.org/pub/freetds/stable/freetds-1.1.4.tar.gz
RUN set -ex && sudo tar -xzf freetds-1.1.4.tar.gz && cd freetds-1.1.4 && sudo ./configure --prefix=/usr/local --with-tdsver=7.3 && sudo make && sudo make install

RUN cd ~

RUN sudo apt-get install -y xvfb
RUN gem install headless

RUN gem install bundler
RUN gem install tiny_tds -v '2.1.2'
RUN gem install capybara-webkit -v '1.15.0'
