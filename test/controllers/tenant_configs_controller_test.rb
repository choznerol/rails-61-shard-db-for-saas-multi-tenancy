require "test_helper"

class TenantConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tenant_config = tenant_configs(:one)
  end

  test "should get index" do
    get tenant_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_tenant_config_url
    assert_response :success
  end

  test "should create tenant_config" do
    assert_difference('TenantConfig.count') do
      post tenant_configs_url, params: { tenant_config: { subdomain: @tenant_config.subdomain } }
    end

    assert_redirected_to tenant_config_url(TenantConfig.last)
  end

  test "should show tenant_config" do
    get tenant_config_url(@tenant_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_tenant_config_url(@tenant_config)
    assert_response :success
  end

  test "should update tenant_config" do
    patch tenant_config_url(@tenant_config), params: { tenant_config: { subdomain: @tenant_config.subdomain } }
    assert_redirected_to tenant_config_url(@tenant_config)
  end

  test "should destroy tenant_config" do
    assert_difference('TenantConfig.count', -1) do
      delete tenant_config_url(@tenant_config)
    end

    assert_redirected_to tenant_configs_url
  end
end
