class UsersController < ApplicationController
	#renders a page for a user to signup
	def new
		@user = User.new
	end

	#to save a new user to the database, the new method doesn't save the user to the database
	def create
		@user = User.new(user_params)
		if @user.save
			#this will be changed later to send an activation email to the user to activate his account
			flash[:success] = "User saved successfully"
			redirect_to root_url #modify it to redirect to th requesting url
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
