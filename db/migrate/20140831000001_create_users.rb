class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :login
      t.string :nickname
      t.boolean :admin, :default => false

    end
  end
end
