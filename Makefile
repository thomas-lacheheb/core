install:
	@echo 'Start install'
	@docker run --rm -v $$PWD:/app composer install
lint:
	@docker run --rm -v $$PWD:/app phpqa/php-cs-fixer fix -vv --diff --dry-run
fix-cs:
	@docker run --rm -v $$PWD:/app phpqa/php-cs-fixer fix
test_unit: install
	@docker run --rm -ti -v $PWD:/app --workdir=/app php:7.3 vendor/bin/phpunit
test_e2e: install
	@docker run --rm -ti -v $PWD:/app --workdir=/app php:7.3 vendor/bin/behat
test: test_unit test_e2e
