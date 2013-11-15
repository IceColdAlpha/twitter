class FavoritesController < ApplicationController
	def new
		
	end
	def create
		if session[:user_id] == nil
			redirect_to login_path
		else
			@favorite = Favorite.new
			@favorite.user_id = session[:user_id]
			@favorite.tweet_id = params[:tweet_id]
			redirect_to :back
		end
		
	end
end
