class Renames < ActiveRecord::Migration[5.2]
  def change
  	rename_column :addresses, :user_id, :customer_id
  	rename_column :cart_items, :user_id, :customer_id
  	rename_column :orders, :user_id, :customer_id
  end
end
