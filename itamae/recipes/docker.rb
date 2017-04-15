include_recipe 'my_env.rb'

file '/etc/sysconfig/i18n' do
  content 'LANG="ja_JP.utf8"'
end

file '/etc/sysconfig/network' do
  :create
end

# nginx
package 'nginx'

service 'nginx' do
  action [:enable, :start]
end

