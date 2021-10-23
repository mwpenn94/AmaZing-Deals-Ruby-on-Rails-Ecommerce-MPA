class CreateProductsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :products_tags do |t|
      t.integer :product_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
