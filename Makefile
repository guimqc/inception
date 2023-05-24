all:
	docker build -t nginx srcs/requirements/nginx
	docker build -t mariadb srcs/requirements/mariadb
	docker build -t wp srcs/requirements/wordpress
	cd srcs && docker-compose up -d

# docker commands:
# docker build -t <image name> <Dockerfile directory>
# docker run -d -p 80:80 <image id>
# docker exec -it <container id> /bin/sh
# docker stop <container name/id>
# docker rm <container name/id>
# docker image rm <image id>