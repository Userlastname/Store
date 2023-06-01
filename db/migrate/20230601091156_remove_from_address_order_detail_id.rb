class RemoveFromAddressOrderDetailId < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_details, :address_id
    add_column :addresses, :order_detail_id, :bigint, index: true
  end
end
