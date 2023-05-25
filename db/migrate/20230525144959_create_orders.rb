class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.datetime :ordered_at
      t.string :status
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
