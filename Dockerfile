FROM nginx
LABEL maintainer="user<user@host.com>"

COPY ./website /usr/share/nginx/html
