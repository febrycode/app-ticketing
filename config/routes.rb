Rails.application.routes.draw do
  get 'event/get_info', to: 'events#index'
  post 'event/create', to: 'events#create'
  post 'location/create', to: 'locations#create'
  post 'event/ticket/create', to: 'ticket_types#create'
  post 'transaction/purchase', to: 'transactions#create'
  get 'transaction/get_info', to: 'transactions#index'
end
