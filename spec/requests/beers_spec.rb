require 'rails_helper'

RSpec.describe 'Beer', type: :request do
  # initialize test data 
  let!(:beers) { create_list(:beer, 10) }
  let(:beer_id) { beers.first.id.to_s }

  # Test suite for GET /beers
  describe 'GET /beers' do
    # make HTTP get request before each example
    before { get '/beers' }

    it 'returns beers' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test for GET /beers/:id
  describe 'GET /beers/:id' do
    before { get "/beers/#{beer_id}" }

    context 'when the record exists' do
      it 'returns the beer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(beer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:beer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find/)
      end
    end
  end

  # Test suite for POST /beers
  describe 'POST /beers' do
    
    let(:valid_attributes) { attributes_for(:beer) }

    context 'when the request is valid' do
      before { post '/beers', params: valid_attributes }

      it 'creates a beer' do
        expect(json['name']).to eq(valid_attributes[:name])
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/beers', params: { title: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation of/)
      end
    end
  end

  # Test suite for PUT /beers/:id
  describe 'PUT /beers/:id' do
    let(:valid_attributes) { { name: 'Changed' } }

    context 'when the record exists' do
      before { put "/beers/#{beer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(json['name']).to eq('Changed')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /beers/:id
  describe 'DELETE /beers/:id' do
    before { delete "/beers/#{beer_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  # Test suite for RANDOM /beers/random
  describe 'GET /beers/random' do
    # make HTTP get request before each example
    before { get '/beers/random' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end