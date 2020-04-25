require "application_system_test_case"

class TenantConfigsTest < ApplicationSystemTestCase
  setup do
    @tenant_config = tenant_configs(:one)
  end

  test "visiting the index" do
    visit tenant_configs_url
    assert_selector "h1", text: "Tenant Configs"
  end

  test "creating a Tenant config" do
    visit tenant_configs_url
    click_on "New Tenant Config"

    fill_in "Subdomain", with: @tenant_config.subdomain
    click_on "Create Tenant config"

    assert_text "Tenant config was successfully created"
    click_on "Back"
  end

  test "updating a Tenant config" do
    visit tenant_configs_url
    click_on "Edit", match: :first

    fill_in "Subdomain", with: @tenant_config.subdomain
    click_on "Update Tenant config"

    assert_text "Tenant config was successfully updated"
    click_on "Back"
  end

  test "destroying a Tenant config" do
    visit tenant_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tenant config was successfully destroyed"
  end
end
