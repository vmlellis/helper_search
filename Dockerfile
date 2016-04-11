FROM ruby:2.3.0
MAINTAINER Victor Lellis <vmlellis@gmail.com>

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
