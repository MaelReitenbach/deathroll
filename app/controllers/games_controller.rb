class GamesController < ApplicationController
	
	def index
		if user_signed_in?
		if current_user.games.length == 0
			current_user.points = 100
		end
		end	
		@prems = []
		@tri = []
		User.all.to_a.each do |u|
			if u.points != nil
				@tri << u
			end
		end
		@prems = @tri.sort_by(&:points).reverse
	end	

	def edit
		@g = Game.find(params[:partid])
			
			if @g.started == false
				@g.started = true
				@g.save
			end	

		roll = rand(1..@g.dice_nb)
		@g.dice_nb = roll
		@g.save
		
		if roll <= 1
			current_user.points = current_user.points - @g.bet
			current_user.save
			if @g.tour == 1
				@other_player = @g.users.find(2)
				@other_player.points = @other_player.points + @g.bet
				@other_player.save
				@g.save
			else
				@other_player = @g.users.find(1)
				@other_player.points += @g.bet
				@other_player.save
				@g.save
			end	
			@g.finished = true
			@g.save

			flash[:lost] = "You rolled 1 :( You lost #{@g.bet} points. Your score is now #{current_user.points}"
			redirect_to action: "show", id: @g.id
		else
			if @g.tour == 1
				@g.tour = 2
				@g.save
			else
				@g.tour = 1
				@g.save
			end		
			flash[:roll] = "You rolled #{@g.dice_nb}, it is now the turn of #{@g.users.find(@g.tour).username}"	
			redirect_to action: "show", id: @g.id
		end	

	end	

	def new
		if user_signed_in?

		else
			redirect_to new_user_session_path	
		end	
	end	

	def create
	  if user_signed_in?
			des = params[:roll].to_i
			pari = params[:bet].to_i
			players = 2
			author = current_user

		if current_user.games.length == 0
			current_user.points = 100
		end

		if des < 1
			flash[:error] = "First roll is too small"
			redirect_to new_game_path
		elsif des > 5000	
			flash[:error] = "First roll is too big"
			redirect_to new_game_path	
		elsif pari < 1
			flash[:error] = "Bet is too small"
			rediret_to new_game_path
		elsif pari > 5000
			flash[:error] = "Bet is too big"
			redirect_to new_game_path
		elsif current_user.points < pari
			flash[:error] = "You dont have enough points to bet this much"
			redirect_to new_game_path
		else
			if current_user.games.length == 0
				current_user.points = 100
			end
			g = Game.create(dice_nb: des, bet: pari, player_nb: players, started: false, finished: false, tour: 1)
			g.users << author
			g.save
			flash[:success] = "Game created."
			redirect_to root_path
		end
	  else 
		redirect_to new_user_session_path
	  end		
	end	

	def show
		@game = Game.find(params[:id])	
	end	
end
