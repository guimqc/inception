all:
	cd srcs && sudo docker-compose up

fclean:
	docker rm -f $$(docker ps -aq) && docker rmi $$(docker images -aq)

# docker commands:
# docker build -t <image name> <Dockerfile directory>
# docker run -d -p 80:80 <image id>
# docker exec -it <container id> /bin/sh
# docker stop <container name/id>
# docker rm <container name/id>
# docker image rm <image id>