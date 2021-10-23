class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :seller_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
