class TicketTypesController < ApplicationController
  def create
    ticket_type = TicketType.new(ticket_type_params)

    if ticket_type.save
      render json: { message: 'Data has been created successfully' }, status: :created
    else
      render json: { message: ticket_type.custom_full_messages }, status: 422
    end
  end

  private

  def ticket_type_params
    params.permit(
      :event_id,
      :name,
      :quota,
      :price
    )
  end
end
