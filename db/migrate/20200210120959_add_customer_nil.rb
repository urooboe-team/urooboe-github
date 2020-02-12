class AddCustomerNil < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :customers, :last_name, false
    change_column_null :customers, :first_name, false
    change_column_null :customers, :kana_last_name, false
    change_column_null :customers, :kana_first_name, false
    change_column_null :customers, :postcode, false
    change_column_null :customers, :address, false
    change_column_null :customers, :telephone, false
    change_column_null :customers, :member_status, false

  end
end
