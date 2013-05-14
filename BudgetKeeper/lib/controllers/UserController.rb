require_relative 'BaseController'
require_relative '../models/User'

module Controllers
  class UserController < BaseController
    
    post '/' do
      @user = Models::User.new(params)
      if @user.save
        session[BaseRestrictedController.USERNAME] = @user.email
        json status: 'ok',
             message: 'User Logged In'
      else
        json status: 'error', 
             error: @user.errors.full_messages.to_sentence
      end
    end
    
  end
end