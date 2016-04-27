class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      #t.integer :player1,       index: true
      t.integer :player1_id,    index: true, foreign_key: true
      t.integer :player2_id,    index: true, foreign_key: true
      t.integer :player1_lifes, default: 3
      t.integer :player2_lifes, default: 3
      t.integer :player1_streak, default: 0
      t.integer :player2_streak, default: 0
      t.integer :player1_points, default: 0
      t.integer :player2_points, default: 0
      t.timestamps null: false
    end
    #add_index :matches, [:player1_id], unique: true
  end
end
