class RemoveEmailFromOrderDetail < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :email
    add_column :order_details, :phone_number, :string
  end
end
