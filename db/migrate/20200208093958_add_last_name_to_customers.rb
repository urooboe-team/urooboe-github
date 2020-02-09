class AddLastNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :fast_name, :string
    add_column :customers, :kana_last_name, :string
    add_column :customers, :kana_first_name, :string
    add_column :customers, :postcode, :string
    add_column :customers, :addless, :string
    add_column :customers, :telephone, :string
    add_column :customers, :member_status, :string
  end
end
