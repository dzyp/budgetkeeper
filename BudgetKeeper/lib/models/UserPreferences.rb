$LOAD_PATH << './lib'
require 'mongoid'
require 'models/User'

module Models
  class UserPreference
    include Mongoid::Document
    
    field :email_at_percent_25, type: Boolean, default: true
    field :email_at_percent_10, type: Boolean, default: true
    
    embedded_in :user
  end
end