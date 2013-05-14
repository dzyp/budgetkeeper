require_relative 'BaseController'

module Controllers
  class MainController < BaseController
    
    get '/' do
      'Hello world'
    end
    
  end
end