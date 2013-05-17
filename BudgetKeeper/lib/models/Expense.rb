$LOAD_PATH << './lib'
require 'mongoid'
require 'models/ExpenseType'
require 'models/User'
require 'time'

module Models
  class Expense
    include Mongoid::Document
    
    field :created, type: Time, default: ->{ Time.now }
    field :units, type: Integer
    
    belongs_to :expense_type
    belongs_to :user
    
    validates_presence_of :user
    validates_presence_of :expense_type
    validates_numericality_of :units, greater_than: 0
    
    def as_json(options = { })
      {
        '_id' => self._id,
        :created => self.created,
        :expense_type_id => self.expense_type_id,
        :units => self.units,
        :type_name => self.expense_type.name
      }
    end
  end
end