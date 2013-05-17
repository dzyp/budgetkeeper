$LOAD_PATH << './lib'
require 'controllers/BaseController'

module Controllers
  class TestController < BaseController
    get '/' do
      'Hello World from test'
    end
    
    get '/set' do
      session['test'] = 'now set'
    end
  end
  
  class TestsController < BaseController
    
    get '/' do
      'Hello World'
    end
    
  end
end