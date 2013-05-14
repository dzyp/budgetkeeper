require_relative '../models/User'

module SessionHelpers
  def logged_in?
    return !session['username'].nil?
  end
  
  def current_user
    @user = Models::User.where(email: session['username']).first
  end
end