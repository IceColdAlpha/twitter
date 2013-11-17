class Follower < ActiveRecord::Base
	#belongs_to :following, class_name: 'User'
	#belongs_to :follower, class_name: 'User'
	#validates_uniqueness_of scope: [:follower, :following]
end
