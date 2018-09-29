require 'rails_helper'

RSpec.describe 'Ticket Type API', type: :request do
  
  describe 'POST /event/ticket/create' do
    let(:headers) { { 'Accept': 'application/json' } }

    context 'with valid attributes' do
      let!(:location) { create(:location) }
      let!(:event) { create(:event, location_id: location.id) }

      let(:valid_attributes) { {
        event_id: event.id,
        name: 'Gold',
        quota: 100,
        price: 100000
      } }

      before { post '/event/ticket/create', params: valid_attributes, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Data has been created successfully/)
      end
    end

    context 'with invalid attributes' do
      before { post '/event/ticket/create', params: {}, headers:  headers}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json['message']).to match(/Event must exist/)
      end
    end
  end
end