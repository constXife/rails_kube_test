FROM ruby:2.6.2-alpine3.9

ENV RAILS_ENV production
ENV PORT 80

WORKDIR /app
COPY . /app

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  sqlite-dev \
  tzdata \
  nodejs \
  yarn \
  && rm -rf /var/cache/apk/*

RUN bundle install --clean --no-cache --deployment

RUN SECRET_KEY_BASE=30ee23cfd63e800d6289032b2f494c2182629ba10e6ee53e8da2aa7d1cfb4981a3be6b90c6a96d82beedc0ac6807ba8ff9b13a4f8a885294b1f40595fd5ed41c bundle exec rake assets:precompile

EXPOSE $PORT

CMD ["./bin/entrypoint.sh"]
