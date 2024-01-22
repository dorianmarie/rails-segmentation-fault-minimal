FROM ruby:3.3.0-slim AS builder
RUN apt-get update -qq
RUN apt-get install -y build-essential
RUN mkdir /app
ARG RAILS_ROOT=/app/
WORKDIR $RAILS_ROOT
COPY . $RAILS_ROOT
RUN gem install bundler
RUN bundle install
RUN bundle exec rake assets:precompile
