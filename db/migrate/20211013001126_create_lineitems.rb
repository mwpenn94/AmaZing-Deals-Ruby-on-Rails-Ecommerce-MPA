class CreateLineitems < ActiveRecord::Migration[5.2]
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.decimal :price
      t.integer :order_id
      t.integer :product_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
