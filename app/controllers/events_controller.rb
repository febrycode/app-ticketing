class EventsController < ApplicationController
  def index
    events = Event.all

    render 'index', locals: { events: events }
  end

  def create
    event = Event.new(event_params)
    event.build_schedule(schedule_params)

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

  def schedule_params
    params.permit(
      :start_time,
      :end_time
    )
  end
end
