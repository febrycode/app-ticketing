require 'rails_helper'

RSpec.describe 'Events API', type: :request do
  describe 'GET /event/get_info' do
    let!(:events) { create_list(:event, 5) }

    before { get '/event/get_info', headers: { 'Accept': 'application/json' } }
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns data event' do
      expect(json['events'].length).to eql(5)
    end
  end

  describe 'POST /event/create' do

    context 'when valid attributes' do
      let!(:location) { create(:location) }
      let(:valid_attributes) {{
        name: 'Sample Event',
        start_time: '2018-10-28 10:30:00',
        end_time: '2018-10-29 10:30:00',
        location_id: location.id
      }}

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