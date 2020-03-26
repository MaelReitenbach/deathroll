class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
    	t.integer :dice_nb
    	t.integer :bet
    	t.integer :player_nb
      t.integer :tour
    	t.boolean :started
    	t.boolean :finished
      t.timestamps
    end
  end
end
