class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :description
      t.integer :customer_id
      t.integer :product_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
