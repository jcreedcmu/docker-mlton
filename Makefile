build:
	docker build -t jcreed/mlton .

push:
	docker push "jcreed/mlton:latest"
