class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :postcode
      t.text :address
      t.string :ship_name

      t.timestamps
    end
  end
end
