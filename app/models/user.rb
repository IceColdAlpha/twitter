class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :email, :password, :username
	validates_uniqueness_of :email
	has_many :tweets
	#has_many :followers

end
