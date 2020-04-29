class ApplicationController < ActionController::Base
  around_action :switch_tenant_shard_database

  private

  def switch_tenant_shard_database
    if request.subdomain.present?
      # TODO: 有沒有辦法在 L12 裡還能使用 TenantConfig 呀？
      @tenant_config = TenantConfig.find_by_subdomain(request.subdomain)

      ActiveRecord::Base.connected_to(shard: request.subdomain.to_sym) do
        yield
      end
    else
      yield
    end
  end
end
