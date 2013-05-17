$LOAD_PATH << './lib'
require 'controllers/BaseController'

module Controllers
  class MainController < BaseController
    
    get '/' do
      'Hello world'
    end
    
  end
end