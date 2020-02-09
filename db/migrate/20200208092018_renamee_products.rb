class RenameeProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :products_name, :product_name
  	rename_column :products, :products_description, :product_description
  	rename_column :cart_items, :users_id, :user_id
  	rename_column :cart_items, :products_id, :product_id

  end

end
