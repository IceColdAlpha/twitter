class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def follower_count
  	@follower_count = Follower.where(:follower => session[:user_id]).count
  end

  def following_count
    @following_count = Follower.where(:following => session[:user_id]).count 
  end

  helper_method :current_user
  helper_method :follower_count
  helper_method :following_count
end
