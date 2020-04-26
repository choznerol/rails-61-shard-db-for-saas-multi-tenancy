class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, limit: 10
      t.string :password_digest
      t.integer :role, null: false, default: 0

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
