include_recipe 'base::bash_it'

base_bash_it_custom_plugin 'bash_it/custom/pyenv.bash'

pyenv_version = node['versions']['pyenv']

git "#{Chef::Config[:file_cache_path]}/pyenv" do
  repository node['pyenv']['repository']
  revision pyenv_version
  destination "#{Chef::Config[:file_cache_path]}/pyenv"
  action :sync
end

directory node['pyenv']['dir'] do
  owner node['workstation']['user']
  mode '0777'
end

execute "Copying pyenv's .git to #{node['pyenv']['dir']}" do
  command "rsync -axSH #{Chef::Config[:file_cache_path]}/pyenv/ #{node['pyenv']['dir']}"
  user node['workstation']['user']
end
