include_recipe 'base::bash_it'

base_bash_it_custom_plugin 'bash_it/custom/git-export_editor.bash' do
  variables editor: node['workstation']['git']['editor']
end
