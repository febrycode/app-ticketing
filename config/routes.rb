Rails.application.routes.draw do
  post 'event/create', to: 'events#create'
  post 'location/create', to: 'locations#create'
  post 'event/ticket/create', to: 'ticket_types#create'
end
