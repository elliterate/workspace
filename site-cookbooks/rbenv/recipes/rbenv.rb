include_recipe 'base::bash_it'

base_bash_it_custom_plugin 'bash_it/custom/rbenv.bash'

git "#{Chef::Config[:file_cache_path]}/rbenv" do
  repository node['rbenv']['repository']
  revision node['versions']['rbenv']
  destination "#{Chef::Config[:file_cache_path]}/rbenv"
  action :sync
end

directory node['rbenv']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying rbenv's .git to #{node['rbenv']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/rbenv/ #{node['rbenv']['dir']}"
  user node['workstation']['user']
end
