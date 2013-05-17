$LOAD_PATH << './lib'
require 'mongoid'
require 'models/Account'
require 'models/User'

module Models
  class Membership
    use Mongoid::Document
    
    field :username, type: String
    
    belongs_to :user
    belongs_to :account
    
    validates_presence_of :username
    validates_presence_of :user
    validates_presence_of :account
  end
end