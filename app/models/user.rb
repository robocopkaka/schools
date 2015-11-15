class User < ActiveRecord::Base
	before_save :downcase_email
	validates :name, presence:true, length:{maximum:50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:true, format:{with:VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false}
	has_secure_password #this generates an encrypted password and requires a password_digest attribute in the table
	validates :password, length:{minimum:6}, allow_blank:true

	#this generates a random new token, that will be used for activation and remember tokens
	def User.new_token
		Securerandom.urlsafe_base64
	end

	#creates encrypted digests/strings using the Bcrypt gem
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	private

	def downcase_email
		self.email = email.downcase
	end
end
