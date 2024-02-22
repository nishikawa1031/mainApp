FROM ruby:3.1.2
ENV LANG C.UTF-8

RUN mkdir /sample
WORKDIR /sample
COPY Gemfile /sample/Gemfile
COPY Gemfile.lock /sample/Gemfile.lock
RUN gem install bundler:2.3.7
RUN bundle install
COPY . /sample


# Nginxと通信を行うための準備
RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids

VOLUME $APP_PATH/public
VOLUME $APP_PATH/tmp

# Node.js のインストール
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs

# RUN yarn install --check-files
RUN SECRET_KEY_BASE=placeholder bundle exec rails assets:precompile