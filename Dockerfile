FROM ubuntu:trusty
MAINTAINER nkenbou <nkenbou@gmail.com>
RUN apt-get update
RUN apt-get -y install nginx-extras lua-nginx-redis
COPY nginx.conf /etc/nginx/nginx.conf
VOLUME ["/var/log/nginx"]
EXPOSE 80
CMD ["/usr/sbin/nginx"]
