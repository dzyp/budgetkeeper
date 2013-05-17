$LOAD_PATH << './lib'
require 'models/ExpenseType'
require 'controllers/BaseRestrictedController'
require 'json'

module Controllers
  class ExpenseTypeController < BaseRestrictedController
    def type
      Models::ExpenseType
    end
    
    get '/' do
      load
      { :status => 'ok', :message => @entity }.to_json
    end
    
    put '/' do
      load
      @entity.update_attributes(params)
      @entity.save
      { :status => 'ok', :message => @entity }.to_json
    end
    
    delete '/' do
      load
      @entity.delete
      { :status => 'ok' }.to_json
    end 
  end
  
  class ExpenseTypesController < BaseController
    get '/' do
      { :status => 'ok', :message => Models::ExpenseType.all() }.to_json
    end
    
    post '/' do
      expense = Models::ExpenseType.new(params)
      expense.save
      { :status => 'ok', :message => expense }.to_json
    end
  end
end