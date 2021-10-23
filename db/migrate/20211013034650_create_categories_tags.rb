class CreateCategoriesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_tags do |t|
      t.integer :category_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
