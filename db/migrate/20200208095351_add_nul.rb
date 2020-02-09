class AddNul < ActiveRecord::Migration[5.2]
  def change
  	# customer
  	change_column_null :customers, :last_name, false
    change_column_null :customers, :fast_name, false
    change_column_null :customers, :kana_last_name, false
    change_column_null :customers, :kana_first_name, false
    change_column_null :customers, :postcode, false
    change_column_null :customers, :addless, false
    change_column_null :customers, :telephone, false
    change_column_null :customers, :member_status, false


    change_column_default :customers, :member_status, true
    change_column_default :products, :sale_status, true
    change_column_default :genres, :display, true
    change_column_default :orders, :order_status, 0
    change_column_default :orders, :payment, 0
    change_column_default :order_products, :production_status, 0

  end
end









#cart_items
    # change_column_null :cart_items, :user_id, false
    # change_column_null :cart_items, :product_id, false
    # change_column_null :cart_items, :quantity, false

    #products
    # change_column_null :products, :genre_id, false
    # change_column_null :products, :product_name, false
    # change_column_null :products, :product_description, false
    # change_column_null :products, :nitu_price, false
    # change_column_null :products, :product_image_id, false
    # change_column_null :products, :sale_status, false

   #genre
    # change_column_null :genres, :genre_name, false
    # change_column_null :genres, :display, false

   # change_column_null :addresses, :postcodes, false
   # change_column_null :addresses, :address, false
