install:
	bundle install
	bin/rails db:create
	bin/rails db:migrate
lint:
	bundle exec rubocop
test:
	bundle exec rspec
ci-setup:
	yarn install

.PHONY: test