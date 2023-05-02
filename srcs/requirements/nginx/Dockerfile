FROM alpine:3.16

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./conf/index.html /etc/nginx/http.d
COPY ./conf/style.css /etc/nginx/http.d

RUN	apk update && apk add nginx openssl && \
	mkdir etc/nginx/ssl && \
	chmod 700 etc/nginx/ssl && \
	openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/key.crt \
    -keyout /etc/nginx/ssl/key.key \
    -subj "/C=CA/ST=Quebec/CN=gvial.42.fr"

CMD ["nginx", "-g", "daemon off;"]
