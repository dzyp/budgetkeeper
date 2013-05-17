$LOAD_PATH << './lib'
require 'json'

module PostHelpers
  def parse_params()
    unless request.body.read.nil?
      begin
        params = JSON.parse request.body.read
      rescue
        nil
      end
    end
  end
end