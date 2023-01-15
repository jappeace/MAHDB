.PHONY: help default reload insert enter

default: help
v1-reload: ## start database from scratch
	psql postgres -f ./v1/up.sql

v1-insert: ## insert a typical event
	psql mah -f ./v1/insert.sql

v1-insert-2: ## insert two typical events
	psql mah -f ./v1/insert-2.sql

v1-unapplied: ## select unapplied
	psql mah -f ./v1/unapplied.sql

v2-reload: ## start database from scratch
	psql postgres -f ./v2/up.sql

v2-insert: ## insert a typical event
	psql mah -f ./v2/insert.sql

v2-unapplied: ## select unapplied
	psql mah -f ./v2/unapplied.sql

v3-reload: ## start database from scratch
	psql postgres -f ./v3/up.sql

v3-insert: ## insert a typical event
	psql mah -f ./v3/insert.sql

v3-insert-2: ## insert two typical events
	psql mah -f ./v3/insert-2.sql

v3-unapplied: ## select unapplied
	psql mah -f ./v3/unapplied.sql


enter: ## enter database
	psql mah


help: ## Display this help
	@grep -E '^[ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'
