class JointablesController < ApplicationController
	def create

		g = Game.find(params[:partid])

		if user_signed_in?
			
			if g.users.index(current_user) != nil
				
				if current_user.games.length == 0
					current_user.points = 100
				end

			flash[:error] = "You are already in the game."
			redirect_to root_path
			
			elsif g.users.length >= g.player_nb
				
				if current_user.games.length == 0
				current_user.points = 100
				end

			flash[:error] = "The game is already full."
			redirect_to root_path

			else
		
			if current_user.games.length == 0
				current_user.points = 100
			end

			g.users << current_user
			flash[:success] = "You successfully joined the game!"
			redirect_to root_path

			end	

		else
			redirect_to new_user_session_path	
		end	
		
		
	end	
end
