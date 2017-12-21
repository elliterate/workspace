node.default['workstation']['git']['editor'] = 'vim'

global_config = {
  'core.pager' => 'less -FXRS -x2',
  'core.excludesfile' => "#{node['workstation']['home']}/.gitignore",
  'color.branch' => 'auto',
  'color.diff' => 'auto',
  'color.interactive' => 'auto',
  'color.status' => 'auto',
  'color.ui' => 'auto',
  'help.autocorrect' => -1,
  'push.default' => 'simple',
  'alias.co' => 'checkout',
  'alias.lg' => 'log --graph',
  'alias.st' => 'status'
}

passwd = `getent passwd #{node['workstation']['user']}`.strip.split(":")
gecos = passwd[4].split(",")
name, email = gecos[0], gecos[4]

if !name.to_s.empty?
  global_config['user.name'] = name
end

if !email.to_s.empty?
  global_config['user.email'] = email
end

node.default['workstation']['git']['global_config'] = global_config
