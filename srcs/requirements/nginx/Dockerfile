FROM alpine:3.16

# COPY conf/nginx.conf  /etc/nginx/http.d/default.conf

RUN apk update && apk add nginx openssl

CMD [ "nginx", "-g", "daemon off;" ]
