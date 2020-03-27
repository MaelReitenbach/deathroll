class Game < ApplicationRecord
	has_many :posts
	has_many :jointables
	has_many :users, through: :jointables
end
