class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id
      t.string :products_name
      t.text :products_description
      t.integer :unit_price
      t.string :product_image_id
      t.boolean :sale_status

      t.timestamps
    end
  end
end
