class LocationsController < ApplicationController
  def create
    location = Location.new(location_params)

    if location.save
      render json: { message: 'Data has been created successfully' }, status: :created
    else
      render json: { message: location.custom_full_messages }, status: 422
    end
  end

  private

  def location_params
    params.permit(
      :address,
      :city,
      :state,
      :country,
      :postal_code,
      :phone_number
    )
  end
end
