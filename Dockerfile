FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /afr_load_rails
WORKDIR /afr_load_rails
ADD Gemfile /afr_load_rails/Gemfile
ADD Gemfile.lock /afr_load_rails/Gemfile.lock
RUN bundle install
ADD . /afr_load_rails
