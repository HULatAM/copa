FROM nginx
LABEL maintainer="temistocles<temivg@gmail.com>"

COPY ./website /usr/share/nginx/html
