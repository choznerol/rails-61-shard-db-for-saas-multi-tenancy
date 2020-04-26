class TenantRecord < ActiveRecord::Base
  self.abstract_class = true

  TENANT_SHARDS = ENV.fetch('TENANTS').split(',').map(&:to_sym) - [:default]

  connects_to shards: {
    default: { writing: :default, reading: :default }
  }.merge(TENANT_SHARDS.map do |subdomain|
    database = "tenant_shard_#{subdomain}".to_sym
    [subdomain, { writing: database, reading: database }]
  end.to_h)
end