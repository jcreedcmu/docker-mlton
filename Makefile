build:
	docker build -t jcreed/mlton-twelf-ci .

push:
	docker push "jcreed/mlton-twelf-ci:latest"
