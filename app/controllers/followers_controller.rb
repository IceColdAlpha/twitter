class FollowersController < ApplicationController
	def new
		@follower = Follower.new
	end
	def create

		if session[:user_id] == nil
			redirect_to login_path
		else
			@alreadyfollows = Follower.where(:follower => params[:stalker], :following => params[:stalked]).count
			#tweet.user.first_name
			if @alreadyfollows < 1
				@follower = Follower.new
				@follower.follower = params[:stalker]
				@follower.following = params[:stalked] 
				if @follower.save
					redirect_to root_path
				else
					redirect_to root_path
				end
			else
				redirect_to root_path
			end
		end
	end

end
