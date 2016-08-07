FROM ruby:2.3.1

ENV LANG=C.UTF-8 \
    USER_DIR=/root

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
                       build-essential \
                       nodejs \
                       postgresql-client \
 && rm -rf /var/lib/apt/lists/* \
 && ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir -p $USER_DIR/project

WORKDIR $USER_DIR/project

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY . .
