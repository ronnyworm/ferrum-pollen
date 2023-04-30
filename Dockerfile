FROM ruby:3.0

# install chromium
RUN apt-get update -qq && apt-get install -y chromium

COPY Gemfile* ./

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle lock --add-platform aarch64-linux && bundle config --global frozen 1

WORKDIR /usr/src/app

RUN bundle install

COPY . .

CMD ["ruby", "./pollen.rb"]
#CMD ["sleep", "infinity"]
