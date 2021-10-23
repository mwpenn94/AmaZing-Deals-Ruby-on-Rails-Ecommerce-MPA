class AddDepartmentIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :department_id, :integer
  end
end
