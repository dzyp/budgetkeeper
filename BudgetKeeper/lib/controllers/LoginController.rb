require_relative 'BaseController'
require_relative '../models/User'
require 'json'

module Controllers
  class LoginController < BaseController

    get '?' do
      'do login'
    end
    
    post '/' do
      user = Models::User.authenticate(params['email'], params['password'])
      if user.nil?
        json status: 'error',
             message: 'Invalid Login'
      else
        session['username'] = user.email
        { :status => 'ok' }.to_json
      end
    end

  end
end