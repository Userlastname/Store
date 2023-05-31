class Addresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :city
      t.string :street
      t.text :comment
      t.references :user, foreign_key: false

      t.timestamps
    end
  end
end
