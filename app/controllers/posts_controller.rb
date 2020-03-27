class PostsController < ApplicationController
	def create
	if user_signed_in?
		if current_user.nb_posts == nil
			current_user.nb_posts == 0
			current_user.save
		end
		p = Post.create(content: params[:chat_text])
		p.user = current_user
		p.game = Game.find(params[:game_id])
		p.save
		redirect_to controller: "games", action: "show", id: params[:game_id].to_i
	else
		redirect_to new_user_sessoin_path
	end	
	end
end
