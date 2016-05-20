# class UserController < ApplicationController
#   def new
#   end

#   def create
#   	user = User.create user_params
#   	if user.valid?
#   		session[:user_id] = user.id
#   		flash[:success] = "Your account has been created"
#   		redirect_to root_path
#   	else
#   		messages = user.errors.map { |k, v| "#{k} #{v}" }
#   		flash[:danger] = messages.join(', ')
#   		redirect_to signup_path
#   	end
#   end

#   private

#   def user_params
#   	params.require(:user).permit(:email, :name, :password, :password_confirmation)
#   end
# end
