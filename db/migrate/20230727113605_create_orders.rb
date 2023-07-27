class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :posted_at
      t.string :client_fullname, null: false
      t.string :client_phone_number, null: false
      t.string :client_email, null: false
      t.string :address
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status, null: false
      t.text :payment_service_metadata 
      t.timestamps
    end
  end
end
