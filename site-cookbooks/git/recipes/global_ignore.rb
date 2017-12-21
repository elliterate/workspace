template "#{node['workstation']['home']}/.gitignore" do
  source 'gitignore.erb'
  owner node['workstation']['user']
end
