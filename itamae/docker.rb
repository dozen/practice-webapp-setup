include_recipe 'my_env.rb'

# install basic-tools
execute 'groupinstall Development Tools' do
  command 'yum groupinstall "Development Tools" -y'
end
package 'yum-utils'
package 'diffutils'
package 'ImageMagick'
package 'ImageMagick-devel'
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
  command 'mysql < files/create-db.sql'
  not_if 'echo "SHOW DATABASES;" | mysql | grep ogiri'
end

execute 'go install' do
  command 'tar -C /usr/local -xzf files/go1.8.1.linux-amd64.tar.gz; echo "export PATH=$PATH:/usr/local/go/bin" > /etc/profile.d/go.sh'
  not_if '[ -e /usr/local/go ]'
end
