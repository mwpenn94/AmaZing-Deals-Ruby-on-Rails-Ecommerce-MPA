class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :email
      t.string :card_number
      t.string :card_expiration_date
      t.string :card_verification
      t.string :bill_firstname
      t.string :bill_lastname
      t.string :bill_address1
      t.string :bill_address2
      t.string :bill_city
      t.string :bill_state
      t.string :bill_zipcode
      t.string :ship_firstname
      t.string :ship_lastname
      t.string :ship_address1
      t.string :ship_address2
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zipcode
      t.string :phone
      t.decimal :total
      t.integer :customer_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
