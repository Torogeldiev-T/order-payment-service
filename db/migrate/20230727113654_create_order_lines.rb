class CreateOrderLines < ActiveRecord::Migration[7.0]
  def change
    create_table :order_lines do |t|
      t.references :order, foreign_key: true
      t.string :order_item_name, null: false
      t.decimal :order_item_price, precision: 10, scale: 2, null: false
      t.integer :order_item_units
      t.decimal :total_price, precision: 10, scale: 2
      t.timestamps
    end
  end
end
