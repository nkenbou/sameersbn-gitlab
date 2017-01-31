FROM redmine:latest
MAINTAINER Kenichi Sone <nkenbou@gmail.com>

RUN groupadd -g 998 git && useradd -u 998 -g git git && gpasswd -a redmine git
