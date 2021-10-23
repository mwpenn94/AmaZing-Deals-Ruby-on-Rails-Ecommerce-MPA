class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.boolean :support, default: false
      t.boolean :seller, default: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
