$LOAD_PATH << './lib'
require 'controllers/BaseRestrictedController'
require 'models/Expense'

module Controllers
  class ExpenseController < BaseRestrictedController
    def type
      Models::Expense
    end
    
    get '/' do
      load
      { :status => 'ok', :message => @entity }.to_json
    end
    
    put '/' do
      load!
      @entity.update_attributes(params)
      if @entity.save
        { :status => 'ok', :message => @entity}.to_json
      else
        { :status => 'error', 
          :message => @entity.errors.full_messages.to_sentence 
        }.to_json
      end
    end
  end
  
  class ExpensesController < BaseRestrictedController
    def type
      Models::Expense
    end
    
    post '/' do
      expense = current_user.expenses.new(params)
      if current_user.save
        { :status => 'ok', :message => expense }.to_json
      else
        { :status => 'error', 
          :message => expense.errors.full_messages.to_sentence
        }.to_json
      end
    end
    
    get '/' do
      { :status => 'ok', :message => current_user.expenses.all() }.to_json
    end
    
  end
end