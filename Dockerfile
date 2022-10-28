FROM nginx
LABEL maintainer="dmunoz<dmunoz31975@gmail.com>"

COPY ./website /usr/share/nginx/html
