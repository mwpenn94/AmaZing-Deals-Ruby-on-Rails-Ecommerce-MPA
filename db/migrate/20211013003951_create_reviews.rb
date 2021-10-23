class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :title
      t.string :description
      t.integer :customer_id
      t.integer :product_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
