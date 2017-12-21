include_recipe 'git::install'

node['workstation']['git']['global_config'].each_pair do |setting, value|
  git_config setting do
    setting_value value
    scope :global
  end
end
