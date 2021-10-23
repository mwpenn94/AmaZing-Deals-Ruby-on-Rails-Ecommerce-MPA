class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
