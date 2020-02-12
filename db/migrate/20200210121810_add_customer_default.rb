class AddCustomerDefault < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :customers, :member_status, true
  end
end
