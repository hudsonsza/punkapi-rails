#
# Using for exception with mongoid
# Create for normalize exception
module ExceptionHandler
  extend ActiveSupport::Concern

  included do

    rescue_from Mongoid::Errors::Validations do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end
    
  end
end