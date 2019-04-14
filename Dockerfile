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

RUN bundle exec rake assets:precompile

EXPOSE $PORT

CMD ["./bin/entrypoint.sh"]
