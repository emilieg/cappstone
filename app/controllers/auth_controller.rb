class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callback]

  def logout
  	session[:user_id] = nil

    return '200'
  	# redirect_to root_path
  end

  def failure
  	render plain: "Auth failed"
  end

  def login

  end

  def callback
    puts 'successfully made it to callback action'
    data = params

      puts 'data:'
      puts data

  	user = User.find_or_create_by(provider_id: data[:provider_id], provider: data[:provider]) do |u|
  		u.provider_hash = data[:provider_hash]
  		u.name = data[:name]
  		u.email = data[:email]
  	end



  	#attach a user id to the current session
  	session[:user_id] = user.id
    @current_user = user

  	#redirect the user to the homepage
    return '200'

  end
end
