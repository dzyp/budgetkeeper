require 'json'
require 'sinatra/base'

module Controllers
  class BaseController < Sinatra::Base
    
    configure do
      enable :sessions
      set :raise_errors, true
    end
    
    after do
      content_type :json
    end
    
    def json_data
      @json_data ||= JSON.parse(request.body.read)
    end
  end
end