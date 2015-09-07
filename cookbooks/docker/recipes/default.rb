#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash "install docker" do
  code <<-EOC
    curl -sSL https://get.docker.com/ | sh
  EOC
  not_if 'which docker'
end

bash "install docker-compose" do
  code <<-EOC
    curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  EOC
  not_if 'which docker-compose'
end

bash "edit /etc/default/docker" do
  code <<-EOC
    echo 'DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"' >> /etc/default/docker
  EOC
  notifies :restart, 'service[docker]'
end

service "docker" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
  supports :restart => true, :reload => true
end
