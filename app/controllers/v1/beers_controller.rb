module V1
  class BeersController < ApplicationController
    before_action :set_beer, only: [:show, :update, :destroy]

    # GET /beers
    def index
      @beers = Beer.all.paginate(page: params[:page], per_page: params[:per_page])
      json_response(@beers)
    end

    # POST /beers
    def create
      @beer = Beer.create!(beer_params)
      json_response(@beer, :created)
    end

    # GET /beers/:id
    def show
      json_response(@beer)
    end

    # PUT /beers/:id
    def update
      @beer.update(beer_params)
      json_response(@beer)
    end

    # DELETE /beers/:id
    def destroy
      @beer.destroy
      head :no_content
    end

    # GET /beers/random
    def random
      json_response(Beer.all.sample)
    end

    private

    def beer_params
      # whitelist params
      params.permit(:name, :description)
    end

    def set_beer
      @beer = Beer.find(params[:id])
    end
  end
end