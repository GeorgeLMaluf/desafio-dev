FROM ruby:2.6.7-alpine
RUN gem install bundler:2.2.30

RUN apk --update add --virtual build-dependencies build-base postgresql-dev linux-headers libsass-dev
RUN apk --update add libpq bash libxml2 libxml2-dev libxml2-utils libxslt openssl zlib tzdata git \
    libc6-compat gcompat libass netcat-openbsd less shared-mime-info

RUN mkdir /api
WORKDIR /api
ADD Gemfile /api/Gemfile
RUN bundle install
ADD Gemfile.lock /api/Gemfile.lock
ADD . /api

EXPOSE 4000
