class ApplicationController < ActionController::Base
  around_action :switch_tenant_shard_database

  private

  def switch_tenant_shard_database
    if request.subdomain.present?
      ActiveRecord::Base.connected_to(shard: request.subdomain.to_sym) do
        yield
      end
    else
      yield
    end
  end
end
