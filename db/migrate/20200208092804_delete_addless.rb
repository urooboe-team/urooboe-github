class DeleteAddless < ActiveRecord::Migration[5.2]
  def change
  	drop_table :addlesses
  end
end
