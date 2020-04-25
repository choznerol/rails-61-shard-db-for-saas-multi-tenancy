class CreateTenantConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :tenant_configs do |t|
      t.string :subdomain, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
