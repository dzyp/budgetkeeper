$LOAD_PATH << './lib'
require 'mongoid'

module Models
  class Account
    include Mongoid::Document
  end
end