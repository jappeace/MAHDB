
reload:
	psql postgres -f ./up.sql

insert:
	psql mah -f ./insert.sql

enter:
	psql mah
