FROM ubuntu:trusty
MAINTAINER nkenbou <nkenbou@gmail.com>
RUN apt-get update && \
    apt-get -y install \
      nginx-extras \
      lua-nginx-redis && \
    rm -rf /var/lib/apt/lists/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY cert.key /etc/nginx/cert.key
COPY cert.crt /etc/nginx/cert.crt
COPY dhparam.pem /etc/nginx/dhparam.pem
RUN chmod 400 /etc/nginx/cert.key
VOLUME ["/var/log/nginx"]
EXPOSE 80
CMD ["/usr/sbin/nginx"]
