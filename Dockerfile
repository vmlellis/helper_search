FROM phusion/passenger-ruby22
MAINTAINER Victor Lellis <vmlellis@gmail.com>

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

# Add the nginx info
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

# APP environment
ENV APP_HOME /home/app/webapp
RUN mkdir -p $APP_HOME

# Update bundle
RUN gem install bundler

# Install bundle of gems
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install

# Add the Rails app
ADD . $APP_HOME

RUN chown -R app:app $APP_HOME

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# APP workdir
WORKDIR $APP_HOME
