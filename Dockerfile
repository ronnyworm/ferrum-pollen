FROM ruby:3.3

WORKDIR /app

RUN apt-get update -qq && \
    apt-get install -y chromium

COPY Gemfile* ./
RUN bundle install

COPY . .

CMD ["ruby", "./pollen.rb"]
