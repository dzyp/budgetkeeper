require_relative 'BaseRestrictedController'

module Controllers
  class TestController < BaseRestrictedController
    get '/' do
      'value = ' << session['test'].inspect
    end
    
    get '/set' do
      session['test'] = 'now set'
    end
  end
end