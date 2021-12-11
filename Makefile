up:
	docker-compose up

env_build: db_up
	make images_build
	make db_reset

env_drop:
	docker-compose down
	make db_delete
	make volume_delete
	make images_delete

env_reset:
	make env_drop
	make env_build

db_up:
	docker-compose up -d db

db_reset:
	docker-compose run --rm app ./manage.py reset_db --close-sessions --noinput
	docker-compose run --rm app ./manage.py migrate
	make set_base_site

db_delete:
	sudo rm -rf docker/mysql/data/*

images_delete:
	docker image rm does_app:dev_test
	docker image rm does_nginx:dev_test

images_build:
	docker-compose build --force-rm app
	docker-compose build --force-rm nginx 

images_build_deploy:
	docker-compose -f docker-compose.deploy.yml build --force-rm app
	docker-compose -f docker-compose.deploy.yml build --force-rm nginx

set_base_site:
	docker-compose run --rm app ./manage.py loaddata ./[PATH_TO_FIXTURES].yaml

test:
	docker-compose run --rm app /app/manage.py test -v3 $(test_path)

volume_delete:
	docker volume rm does_python_packages
