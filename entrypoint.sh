#!/bin/sh

set -eu

echo "Checking DB connection ..."

i=0
until [ $i -gt 10 ]
do
  nc -z $MYSQL_HOST 3306 && break

  i=$(( i + 1 ))
  echo "Waiting for one second"
  sleep 1
done

if [ $i -eq 10 ]
then
  echo "DB connection failed"
  exit 1
fi

echo "DB is up"

#python manage.py migrate

exec "$@"