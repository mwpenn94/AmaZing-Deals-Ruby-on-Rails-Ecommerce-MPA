class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :question_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
