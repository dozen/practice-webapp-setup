include_recipe 'my_env.rb'

# install basic-tools
package 'git'
package 'yum-utils'
package 'diffutils'

file '/etc/sysconfig/i18n' do
  content 'LANG="ja_JP.UTF-8"'
end

file '/etc/sysconfig/network' do
  :create
end

# install
package 'nginx'
package 'epel-release'
execute 'add remi' do
  command 'rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm; yum-config-manager --enable remi'
  not_if 'rpm -q remi-release'  
end
package 'redis'
package 'mysql56'
package 'mysql56-server'
package 'mysql56-devel'
package 'ruby23-devel'

execute 'groupinstall Development Tools' do
  command 'yum groupinstall "Development Tools" -y'
end

service 'nginx' do
  action [:enable, :start]
end

service 'redis' do
  action [:enable, :start]
end

service 'mysqld' do
  action [:enable, :start]
end

git '/var/www/app' do
  repository 'git@github.com:dozen/practice-webapp.git'
end

execute 'create database' do
  command 'mysql < ../files/create-db.sql'
  not_if 'echo "SHOW DATABASES;" | mysql | grep ogiri'
end
