include_recipe 'my_env.rb'

file '/etc/sysconfig/i18n' do
  content 'LANG="ja_JP.utf8"'
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

service 'nginx' do
  action [:enable, :start]
end

service 'redis' do
  action [:enable, :start]
end

service 'mysqld' do
  action [:enable, :start]
end
