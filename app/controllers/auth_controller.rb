class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callback]

  def logout
  	session[:user_id] = nil
    session[:access_token] = nil
    session[:email] = nil

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

    user = User.find_or_create_by(provider_id: data[:provider_id])
    
      puts user
      user.update(provider_hash: data[:provider_hash], name: data[:name], email:data[:email])
      user.save

  	#attach a user id to the current session
  	session[:user_id] = user.id
    session[:access_token] = user.provider_hash
    session[:email] = user.email
    @current_user = user

  	#redirect the user to the homepage
    return '200'

  end
end
