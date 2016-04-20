class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string  :name
      t.integer :wins_with1
      t.integer :wins_with2
      t.integer :loses_with1
      t.integer :loses_with2

      t.timestamps null: false
    end
  end
end
