require 'json_web_token'
class AuthenticateUser 
	
	prepend SimpleCommand 
	
	def initialize(username, password) 
		@username = username 
		@password = password 
	end 
	
	def call 
		JsonWebToken.encode(email: user.email) if user 
	end 
	
	private 
	
	attr_accessor :username, :password 
	
	def user
		Rails.logger.debug "---------------------------------"
		user = User.find_by_email(username) 
		if user.nil?
			Rails.logger.debug "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
			user = User.find_by_contact(username) 
		end
		return user if user && user.authenticate(password) 
		
		errors.add :user_authentication, 'invalid credentials' 
		
		nil 
	end 
end
