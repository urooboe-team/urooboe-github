class AddCustomerColumn < ActiveRecord::Migration[5.2]
  def change
  	# customer
    add_column :customers, :last_name, :string
    add_column :customers, :first_name, :string
    add_column :customers, :kana_last_name, :string
    add_column :customers, :kana_first_name, :string
    add_column :customers, :postcode, :string
    add_column :customers, :address, :string
    add_column :customers, :telephone, :string
    add_column :customers, :member_status, :boolean

  end
end
