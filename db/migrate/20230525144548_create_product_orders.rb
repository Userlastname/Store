class CreateProductOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :product_orders do |t|
      t.references :order
      t.references :product
      t.integer :amount
      t.timestamps
    end
  end
end
