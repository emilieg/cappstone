class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def is_authenticated?
  	# if current_user
    unless current_user
    puts '****CURRENT_USER**** ', current_user
    
		flash[:danger] = "You are not logged in. Please log in."
		redirect_to root_path
  	end
  end

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  end
end
