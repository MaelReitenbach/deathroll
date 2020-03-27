class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@games = @user.games.to_a.reverse
	end	

	def index
		
	end	
end
