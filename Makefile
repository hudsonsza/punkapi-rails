CURRENT_DIRECTORY := $(shell pwd)

DCMP = docker-compose
DCMP_EXEC_APP = ${DCMP} exec app
DCMP_EXEC_MONGO = ${DCMP} exec mongo

build: 
	${DCMP} build

run:
	${DCMP} up

bash:
	${DCMP} run app bash

console:
	${DCMP_EXEC_MONGO} bundle exec rails c

rebuild:
	${DCMP} build --no-cache

rubocop:
	${DCMP} run app rubocop

test:
	${DCMP} run app bash -c "RAILS_ENV=test bundle exec rspec"

development:
	bundle install
	rm -f tmp/pids/server.pid
	bundle exec rails s -b 0.0.0.0

mongorestore:
	${DCMP_EXEC_MONGO} mongorestore /data/dumps/latest/

mongodump:
	${DCMP_EXEC_MONGO} bash -c "rm -Rf /data/dumps/latest && mkdir -p /data/dumps/latest && mongodump --host mongo --port 27017 --out /data/dumps/latest"
