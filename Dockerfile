FROM ruby:2.3.0
MAINTAINER Victor Lellis <vmlellis@gmail.com>

RUN apt-get update && apt-get install -y build-essential nodejs

WORKDIR /tmp
ADD Gemfile* $APP_HOME/
RUN bundle install

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME
