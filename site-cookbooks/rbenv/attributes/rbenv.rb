include_attribute 'base::home'

node.default['versions']['pyenv'] = 'HEAD'
node.default['rbenv'] = {
  'dir' => ::File.expand_path('.rbenv', node['workstation']['home']),
  'repository' => 'https://github.com/rbenv/rbenv'
}
