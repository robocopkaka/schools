class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :remember_digest
      t.string :activation_digest
      t.string :password_digest
      t.datetime :activated_at

      t.timestamps null: false
    end
  end
end
