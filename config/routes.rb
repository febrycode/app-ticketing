Rails.application.routes.draw do
  post 'event/create', to: 'events#create'
  post 'location/create', to: 'locations#create'
end
