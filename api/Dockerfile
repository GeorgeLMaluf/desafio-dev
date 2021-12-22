FROM ruby:2.6.7-alpine
RUN gem install bundler:2.2.30

RUN mkdir /api
WORKDIR /api
ADD Gemfile /api/Gemfile
RUN bundle install
ADD Gemfile.lock /api/Gemfile.lock
ADD . /api

EXPOSE 3010
