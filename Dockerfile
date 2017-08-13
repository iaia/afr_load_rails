FROM ruby:2.3.3
ENV LANG C.UTF-8

# rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /afr_load_rails
WORKDIR /afr_load_rails
ADD Gemfile /afr_load_rails/Gemfile
ADD Gemfile.lock /afr_load_rails/Gemfile.lock
RUN bundle install
ADD . /afr_load_rails

# task
RUN apt-get update
RUN apt-get install -y cron
RUN apt-get install -y sysv-rc-conf
RUN sysv-rc-conf cron on
RUN bundle exec whenever --update-crontab

# user's development environment
RUN apt-get install -y zsh
RUN chsh -s $(which zsh)
RUN apt-get install -y less
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y imagemagick

