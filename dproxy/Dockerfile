FROM ubuntu:trusty
MAINTAINER nkenbou <nkenbou@gmail.com>
RUN apt-get update
RUN apt-get -y install nginx-extras lua-nginx-redis
COPY nginx.conf /etc/nginx/nginx.conf
COPY cert.key /etc/nginx/cert.key
COPY cert.crt /etc/nginx/cert.crt
COPY dhparam.pem /etc/nginx/dhparam.pem
VOLUME ["/var/log/nginx"]
EXPOSE 80
CMD ["/usr/sbin/nginx"]
