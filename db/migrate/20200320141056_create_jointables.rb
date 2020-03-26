class CreateJointables < ActiveRecord::Migration[5.2]
  def change
    create_table :jointables do |t|
      t.belongs_to :user, index: true
      t.belongs_to :game, index: true
      t.timestamps
    end
  end
end
