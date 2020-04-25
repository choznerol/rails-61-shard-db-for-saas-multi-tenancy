require 'test_helper'

class TenantConfigTest < ActiveSupport::TestCase
  test 'create' do
    tenant_config = TenantConfig.new(subdomain: 'demo')
    tenant_config.validate

    assert tenant_config.valid?
  end

  test 'uniqueness on subdomain' do
    TenantConfig.create!(subdomain: 'demo')

    dup_tenant_config = TenantConfig.new(subdomain: 'demo')
    dup_tenant_config.validate

    assert dup_tenant_config.valid? == false
  end
end
