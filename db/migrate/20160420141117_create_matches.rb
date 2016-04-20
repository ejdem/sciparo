class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player_id
      t.integer :players_lifes, default: 3

      t.timestamps null: false
    end
  end
end
