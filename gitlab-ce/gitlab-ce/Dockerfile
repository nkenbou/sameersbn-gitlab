FROM gitlab/gitlab-ce:8.15.4-ce.1
MAINTAINER Kenichi Sone <nkenbou@gmail.com>

RUN sed -i -e '/storage_directory git_data_directory do/,/end/ s/mode "[0-9]\+"/mode "0750"/ ' /opt/gitlab/embedded/cookbooks/gitlab/recipes/gitlab-shell.rb

RUN sed -i -e '/storage_directory git_data_directory do$/a \ \ \ \ group git_group' /opt/gitlab/embedded/cookbooks/gitlab/recipes/gitlab-shell.rb

RUN sed -i -e '/storage_directory repositories_storage do$/a \ \ \ \ group git_group' /opt/gitlab/embedded/cookbooks/gitlab/recipes/gitlab-shell.rb
