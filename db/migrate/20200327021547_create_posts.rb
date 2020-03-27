class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.text :content
    	t.belongs_to :user, index: true
    	t.belongs_to :game, index: true
      t.timestamps
    end
  end
end
