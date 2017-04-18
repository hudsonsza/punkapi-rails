# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Rails.logger = Logger.new(STDOUT)

# Using original API for import
punkapi_client = PunkAPI::Client.new

# Request API firsts beers
Rails.logger.info "Processing the request data from PunkAPI..."
_beers = punkapi_client.beers
beer = Beer.find_by({ name: _beers.first.name })

# Verify beer on database

Rails.logger.info "Validating if it has already been imported..."
if beer.nil?
    
    _beers.map do |_beer|

        Rails.logger.info "Importing the #{_beer.name} Beer..."
        params = ActionController::Parameters.new(_beer.as_json['table']).permit(:name, :description)
        Beer.create!(params)
    end

end

Rails.logger.info "Finished import..."