include_attribute 'base::home'

rbenv_dir = ::File.expand_path('.rbenv', node['workstation']['home'])

node.default['versions']['ruby-build'] = 'HEAD'
node.default['ruby-build'] = {
  'dir' => ::File.join(rbenv_dir, 'plugins', 'ruby-build'),
  'repository' => 'https://github.com/rbenv/ruby-build'
}
