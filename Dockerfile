FROM ruby:2.3.3

# rails
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /afr_load_rails
WORKDIR /afr_load_rails
ADD Gemfile /afr_load_rails/Gemfile
ADD Gemfile.lock /afr_load_rails/Gemfile.lock
RUN bundle install
ADD . /afr_load_rails

# task
RUN apt-get install -y cron
RUN apt-get install -y sysv-rc-conf
RUN sysv-rc-conf cron on
RUN bundle exec whenever --update-crontab

# user's development environment
RUN apt-get update
RUN apt-get install -y zsh
RUN chsh -s $(which zsh)
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y curl
RUN git clone https://github.com/iaia/dotfiles.git ~/dotfiles
RUN ln -sd ~/dotfiles/.vim/ ~/.vim
RUN ln -s ~/dotfiles/.vimrc ~/.vimrc
RUN ln -s ~/dotfiles/.zshrc ~/.zshrc
RUN ln -s ~/dotfiles/.gitconfig ~/.gitconfig
RUN mkdir ~/dotfiles/.vim
RUN mkdir ~/dotfiles/.vim/.vimundo
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/dotfiles/installer.sh 
RUN sh ~/dotfiles/installer.sh ~/.vim/dein
RUN rm ~/dotfiles/installer.sh
RUN mkdir ~/.ssh/id_rsa
ADD ~/.ssh/id_rsa ~/.ssh/id_rsa
ADD ~/.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
ADD ~/.ssh/config ~/.ssh/config

