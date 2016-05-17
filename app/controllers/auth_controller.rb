class AuthController < ApplicationController
  def logout
  	session[:user_id] = nil
  	redirect_to root_path
  end

  def failure
  	render plain: "Auth failed"
  end

  def callback
  	# get user info from auth provider
  	provider_user = request.env['omniauth.auth']
    puts provider_user

  	# # save the information to our database
  	# user = User.find_or_create_by(provider_id: provider_user[:uid], provider: params[:provider]) do |u|
  	# 	u.provider_hash = provider_user['credentials']['token']
  	# 	u.name = provider_user['info']['name']
  	# 	u.email = provider_user['info']['name']
  	# end

  	# #attach a user id to the current session
  	# session[:user_id] = user.id

  	# # redirect the user to the hompage
  	redirect_to root_path
  end
end
