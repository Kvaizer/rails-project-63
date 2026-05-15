.PHONY: install lint lint-fix test

install:
	bundle install

lint:
	bundle exec rubocop --cache false

lint-fix:
	bundle exec rubocop -A --cache false

test:
	bundle exec ruby -Itest test/hexlet_code_test.rb
