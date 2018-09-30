require 'rails_helper'

RSpec.describe 'Transactions API' do
  describe 'GET /transaction/get_info' do
    let!(:transaction) { create(:transaction) }
    let!(:transaction_detail) { create(:transaction_detail, transaction_id: transaction.id) }

    before { get '/transaction/get_info', headers: { 'Accept': 'application/json' } }
    
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns data transactions' do
      expect(json['transactions'].length).to eql(1)
    end
  end

  describe 'POST /transaction/purchase' do

    let(:headers) { {'Accept': 'application/json'} }

    let!(:events) { create_list(:event, 2) }
    let!(:ticket_types) { create_list(:ticket_type, 2) }
    let(:transaction_params) do
      {
        customer_name: "John Doe",
        customer_email: "john.doe@test.com",
        event_id: events.first.id,
        ticket_types: [
          {
            id: ticket_types.first.id,
            qty: 1
          }
        ]
      }
    end

    context 'when purchase an event one time' do
      before { post '/transaction/purchase', params: transaction_params, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Data has been created successfully/)
      end
    end

    context 'when purchase ticket many times' do
      let!(:transaction) do
        create(
          :transaction,
          customer_name: "John Doe",
          customer_email: "john.doe@test.com",
          event_id: events.first.id
        )
      end

      let!(:transaction_detail) { create(:transaction_detail, { transaction_id: transaction.id }) }

      before { post '/transaction/purchase', params: transaction_params, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match(/Data has been created successfully/)
      end
    end

    context 'when a customer purchase many times but different event' do
      let!(:new_transaction) do
        create(
          :transaction,
          customer_name: "John Smith",
          customer_email: "john.doe@test.com",
          event_id: events.second.id
        )
      end

      let!(:transaction_detail) { create(:transaction_detail, { transaction_id: new_transaction.id }) }

      before { post '/transaction/purchase', params: transaction_params, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns error message' do
        expect(json['message']).to match(/Customer only purchase ticket within same event/)
      end
    end
  end
end