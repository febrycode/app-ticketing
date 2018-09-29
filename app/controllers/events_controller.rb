class EventsController < ApplicationController
  def create
    event = Event.new(event_params)

    if event.save
      render json: { message: 'Data has been created successfully' }, status: :created
    else
      render json: { message: event.custom_full_messages }, status: 422
    end
  end

  private

  def event_params
    params.permit(
      :name,
      :location_id
    )
  end
end
