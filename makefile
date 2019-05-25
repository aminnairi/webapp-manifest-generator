.PHONY: start stop restart shell install reactor format dev prod

install: start
	docker-compose exec node npm install

start:
	docker-compose up -d node

stop:
	[[ -d elm-stuff ]] && rm -r elm-stuff || true
	docker-compose down

restart: stop start

shell: install
	docker-compose exec node bash

reactor: install
	docker-compose exec node npm run reactor

format: install
	docker-compose exec node npm run format

dev: install
	docker-compose exec node npm run dev

prod: install
	docker-compose exec node npm run prod