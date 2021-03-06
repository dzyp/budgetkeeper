$LOAD_PATH << './lib'
require 'models/User'
require 'pp'

module SessionHelpers
  def logged_in?
    return !session[:username].nil?
  end
  
  def current_user
    @user ||= Models::User.where(email: session[:username]).first
  end
end