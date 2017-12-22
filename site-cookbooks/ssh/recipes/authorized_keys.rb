ssh_dir = ::File.join(node['workstation']['home'], '.ssh')

directory ssh_dir do
  owner node['workstation']['user']
  mode '0700'
end

template "#{ssh_dir}/authorized_keys" do
  source 'authorized_keys.erb'
  variables 'authorized_keys' => node['workstation']['authorized_keys']
  mode '0600'
end
