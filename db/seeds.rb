# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TenantRecord::TENANT_SHARDS.each do |subdomain|
  TenantConfig.find_or_create_by! subdomain: subdomain

  ActiveRecord::Base.connected_to shard: subdomain do
    unless User.exists? username: 'admin'
      name = "#{subdomain}admin"
      admin = User.new username: name, role: :admin, password: name, password_confirmation: name
      admin.save!
    end
  end
end
