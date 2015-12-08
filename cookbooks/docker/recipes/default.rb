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
    curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  EOC
  not_if 'which docker-compose'
end

cookbook_file "/etc/default/docker" do
  mode 00644
  notifies :restart, 'service[docker]'
end

service "docker" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
  supports :restart => true, :reload => true
end
