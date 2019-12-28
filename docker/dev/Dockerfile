FROM ruby:2.6.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs \
                                              yarn \
                                              vim

# Bundler
RUN gem install bundler
ENV BUNDLE_PATH /gem-data

WORKDIR /usr/src/app
COPY . .

RUN bundle install
RUN yarn install --check-files
