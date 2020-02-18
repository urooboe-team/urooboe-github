class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.integer :order_status, default: 0
      t.integer :total_fee
      t.integer :payment
      t.integer :freight, default: 800
      t.text :address
      t.string :postcode
      t.string :ship_name

      t.timestamps
    end
  end
end
