class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_users do |t|
      t.references :user,    foreign_key: true
      t.references :product, foreign_key: true

    end 
    end 
end
