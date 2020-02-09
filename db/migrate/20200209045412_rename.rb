class Rename < ActiveRecord::Migration[5.2]
  def change
  	rename_column :customers, :addless, :address
  end
end
