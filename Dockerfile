FROM ruby:3.1.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
ADD . /rails_work
WORKDIR /rails_work
COPY Gemfile /rails_work/Gemfile
COPY Gemfile.lock /rails_work/Gemfile.lock
RUN bin/rails db:create
RUN bundle install
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
EXPOSE 3000
