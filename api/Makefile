.PHONY: lint lint_autocorrect

lint:
	bundle exec rubocop Gemfile *.rb app/ lib/ spec/ config/ db/

lint_autocorrect:
	bundle exec rubocop -A Gemfile *.rb app/ lib/ spec/ config/ db/