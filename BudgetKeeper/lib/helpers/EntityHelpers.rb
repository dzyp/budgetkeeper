$LOAD_PATH << './lib'
require 'json'

module EntityHelpers
  def load
    if params.has_key? '_id'
      @entity ||= self.type.find(params['_id'])
    end
  end
  
  def load!
    unless params.has_key? '_id'
      halt 200, { :status => 'error', :message => 'Entity not found' }.to_json
    end
    @entity ||= self.type.find(params['_id'])
    if @entity.nil?
      halt 200, { :status => 'error', :message => 'Entity not found' }.to_json
    end
  end
end