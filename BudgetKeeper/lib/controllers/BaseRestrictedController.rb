require 'json'
require_relative 'BaseController'
require_relative '../helpers/SessionHelpers'

module Controllers
  class BaseRestrictedController < BaseController
    
    helpers SessionHelpers
    
    ROLE = 'role'
    USERNAME = 'username'
    USER = 'user'
    ADMIN = 'admin'
    ROLE_PRIORITY = [USER, ADMIN]
    
    def expected_role
      USER
    end
    
    before do
      if not logged_in?
        halt 401, { :status => 'Not Logged In', :message => 'Access Denied' }.to_json
      end
    end
    
  end
end