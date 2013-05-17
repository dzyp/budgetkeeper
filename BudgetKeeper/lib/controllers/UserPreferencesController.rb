$LOAD_PATH << './lib'
require 'controllers/BaseRestrictedController'
require 'json'

module Controllers
  class UserPreferencesController < BaseRestrictedController
    enable :sessions
    
    post '/' do
      current_user.user_preference.update_attributes(params)
      current_user.user_preference.save
      { :status => 'ok' }.to_json
    end
    
    get '/' do
      { :status => 'ok', 
        :message => current_user.user_preference.attributes }.to_json
    end
  end
end