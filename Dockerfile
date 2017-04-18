FROM ruby:2.3.3

RUN mkdir /src
WORKDIR /src

ADD Gemfile /src/Gemfile
ADD Gemfile.lock /src/Gemfile.lock
RUN bundle install
