class TweetsController < ApplicationController
	def index
		@tweets = Tweet.where("user_id = ?", session[:user_id])
		if @tweets == []
			redirect_to new_tweet_path
		else

		end
				
	end
	
	def new
		@tweet = Tweet.new
		
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

		
	end

private
def tweet_params
	params.require(:tweet).permit(:body)
	
end

end
