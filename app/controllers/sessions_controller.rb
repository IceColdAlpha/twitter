class SessionsController < ApplicationController
	def new
		
	end
	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			#redirect_to tweets_path
			redirect_to tweet_path(session[:user_id])
		else
			render "new"
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

end