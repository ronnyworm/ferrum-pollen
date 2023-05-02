initial:
	docker run --rm -v "$PWD":/app -w /app ruby:3.2 bundle install

build:
	docker build -t pollen .

run:
	docker run --rm -v "$PWD":/app -w /app pollen
