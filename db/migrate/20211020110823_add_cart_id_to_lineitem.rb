class AddCartIdToLineitem < ActiveRecord::Migration[5.2]
  def change
    add_column :lineitems, :cart_id, :integer
  end
end
