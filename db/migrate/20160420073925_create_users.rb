class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.integer :played_matches, default: 0
      t.integer :wins,    default: 0
      t.integer :loses,   default: 0
      t.integer :streak,  default: 0

      t.timestamps null: false
    end
  end
end
