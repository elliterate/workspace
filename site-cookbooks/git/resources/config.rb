property :setting_key, String, name_attribute: true
property :setting_value, [String, Integer]
property :setting_owner, String, default: node['workstation']['user']
property :scope, is: [:system, :global], default: :global

default_action :create

action :create do
  execute ["git", "config", "--#{scope}", setting_key.to_s, setting_value.to_s] do
    user setting_owner
  end
end
