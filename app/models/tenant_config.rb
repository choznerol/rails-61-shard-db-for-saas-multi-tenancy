class TenantConfig < AdminRecord
  validates_uniqueness_of :subdomain
end
