require 'will_paginate/mongoid'

module Mongoid
  module Document
    def as_json(options={})
      attrs = super(options)
      attrs["id"] = attrs["_id"].to_s
      attrs
    end
  end
end


Mongoid.load!("config/mongoid.yml")
Mongoid.raise_not_found_error = false # using for Mongoid::Errors::DocumentNotFound

Mongoid.logger.level = Logger::DEBUG
Mongoid.logger = Logger.new("#{Rails.root}/log/mongoid_#{Rails.env}.log")
