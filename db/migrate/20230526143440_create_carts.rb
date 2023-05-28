class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: true, foreign_key: false

      t.timestamps
    end
  end
end
