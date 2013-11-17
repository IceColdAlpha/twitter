class TweetsController < ApplicationController
	def index
		@follower_count = follower_count
		@following_count = following_count
		
		#raise 'x'
		@tweets = Tweet.where("user_id = ?", session[:user_id])
		@tweets = @tweets.reverse
		if @tweets == []
			redirect_to new_tweet_path
		else

		end
				
	end
	
	def new
		@tweet = Tweet.new
		if session[:user_id] == nil
			redirect_to login_path
		end
		
	end
	def create
		@tweet = Tweet.new(tweet_params)
		@tweet.user_id = session[:user_id]
		if @tweet.save
			redirect_to tweets_path
		else
			render "new"
		end
	end
	def show
		#Follower.where(:follower => params[:stalker], :following => params[:stalked]).count
		i_follow = Follower.where(:follower => session[:user_id])
		if i_follow.empty?
			redirect_to root_path
		end

		#@i_follow_tweets = [] #Array.new
		i_follow.each do |f|
			#new_relation = relation.merge(another_relation)
			#@i_follow_tweets = Tweet.where(:user_id => f.following)
			hold = Tweet.where(:user_id => f.following)
			@i_follow_tweets = hold.merge(hold)
			
			#count = @i_follow_tweets.count
		end
	
		@i_follow_tweets = @i_follow_tweets.reverse

	end

private
def tweet_params
	params.require(:tweet).permit(:body)
	
end

end
