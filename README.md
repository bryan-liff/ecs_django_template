# Development

## Initial setup
  Install docker-compose

  `$ make env_reset`  
  `$ make`

  http://localhost/

  Shutdown:
  Ctrl+C  
  `$ docker-compose down`

  Run tests:  
  `$ make test`

## bash
docker-compose run --rm [app|db] bash

/app# ./manage.py --help  
/app# ./manage.py shell_plus  

## DB console
docker-compose exec db mysql -uroot -p  

### Migrations
# when models changed
python manage.py makemigrations [APP]

# view SQL
python manage.py sqlmigrate [APP] XXXX

# run migration
python manage.py migrate

# reset DB
./manage.py reset_db --close-sessions --noinput && ./manage.py migrate

# superuser
./manage.py createsuperuser --email 'admin@does.com'

# Testing
./manage.py test --pattern="tests_*.py"
