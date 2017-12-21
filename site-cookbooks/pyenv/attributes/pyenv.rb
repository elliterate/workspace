include_attribute 'base::home'

node.default['versions']['pyenv'] = 'HEAD'
node.default['pyenv'] = {
  'dir' => ::File.expand_path('.pyenv', node['workstation']['home']),
  'repository' => 'https://github.com/pyenv/pyenv'
}
