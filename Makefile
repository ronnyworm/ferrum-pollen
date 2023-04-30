initial:
	docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app ruby:3.0 bundle install

build:
	docker build -t pollen .

run:
	docker run --rm -v "$PWD":/usr/src/app -w /usr/src/app pollen