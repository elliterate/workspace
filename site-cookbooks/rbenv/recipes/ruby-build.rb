include_recipe 'rbenv::rbenv'

git "#{Chef::Config[:file_cache_path]}/ruby-build" do
  repository node['ruby-build']['repository']
  revision node['versions']['ruby-build']
  destination "#{Chef::Config[:file_cache_path]}/ruby-build"
  action :sync
end

directory node['ruby-build']['dir'] do
  owner node['workstation']['user']
  recursive true
  mode '0777'
end

execute "Copying ruby-build's .git to #{node['ruby-build']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/ruby-build/ #{node['ruby-build']['dir']}"
  user node['workstation']['user']
end
