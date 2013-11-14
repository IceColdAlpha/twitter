class UsersController < ApplicationController
	def new
		@user = User.new
		
	end
	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to "https:/www.google.com"
		else
			render "new"
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
	
	private
	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :username, :bio, :password, :password_confirmation)
	end
end
