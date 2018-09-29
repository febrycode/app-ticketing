require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  describe 'POST /event/create' do

    context 'when valid attributes' do
      let!(:location) { create(:location) }
      let(:valid_attributes) { { name: 'Sample Event', location_id: location.id } }

      before { post '/event/create', params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Data has been created successfully/)
      end
    end

    context 'when invalid attributes' do
      before { post '/event/create', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json['message']).to match(/Location must exist/)
      end
    end
  end
end