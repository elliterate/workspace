node.default['workstation']['git']['editor'] = 'vim'

node.default['workstation']['git']['global_config'] = {
  'core.pager' => '"less -FXRS -x2"',
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
