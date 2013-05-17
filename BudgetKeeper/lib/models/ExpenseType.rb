$LOAD_PATH << './lib'
require 'mongoid'
require 'models/Expense'

module Models
  class ExpenseType
    include Mongoid::Document
    
    field :name, type: String
    
    has_many :expenses
    validates_presence_of :name, allow_nil: false
    validates_uniqueness_of :name
  end
end