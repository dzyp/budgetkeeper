$LOAD_PATH << './lib'
require 'json'
require 'sinatra/base'
require 'helpers/PostHelpers'
require 'helpers/EntityHelpers'

module Controllers
  class BaseController < Sinatra::Base
    helpers PostHelpers, EntityHelpers
    
    configure do
      set :sessions, true
      set :raise_errors, true
    end
    
    before do
      params = parse_params()
      puts params
    end
    
    after do
      content_type :json
    end
    
    def json_data
      @json_data ||= JSON.parse(request.body.read)
    end
    
  end
end