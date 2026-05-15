.PHONY: install lint lint-fix test

install:
	bundle install

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

test:
	ruby -Itest test/hexlet_code_test.rb