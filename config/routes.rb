TENANT_SHARDS = ENV.fetch('TENANTS').split(',') - ['default']

Rails.application.routes.draw do
  root 'tenant_configs#index'
  resources :tenant_configs

  constraints(->(req) { TENANT_SHARDS.include? req.subdomain }) do
    resources :users
  end
end
