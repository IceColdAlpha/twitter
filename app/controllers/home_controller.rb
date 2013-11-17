class HomeController < ApplicationController
	def index
		@tweets = Tweet.last(100)
		@tweets = @tweets.reverse
		
	end
end