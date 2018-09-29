require 'rails_helper'

RSpec.describe 'Locations API', type: :request do
  describe 'POST /location/create' do
    let(:headers) { { 'ACCEPT': 'application/json' } }

    context 'when valid attributes' do
      let(:valid_attributes) {{
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        country: Faker::Address.country,
        postal_code: Faker::Address.postcode,
        phone_number: Faker::PhoneNumber.phone_number
      }}

      before { post '/location/create', params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Data has been created successfully/)
      end
    end

    context 'when invalid attributes' do
      let(:invalid_attributes) { {} }

      before { post '/location/create', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json['message']).to match(/can't be blank/)
      end
    end
  end
end