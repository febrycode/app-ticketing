json.events events do |event|
  json.id event.id
  json.name event.name
  json.start_time event.schedule.start_time
  json.end_time event.schedule.end_time

  json.location do
    json.id event.location.id
    json.address event.location.address
    json.city event.location.city
    json.state event.location.state
    json.postal_code event.location.postal_code
    json.phone_number event.location.phone_number
  end

  json.ticket_types event.ticket_types do |ticket_type|
    json.id ticket_type.id
    json.name ticket_type.name
    json.quota ticket_type.quota
    json.price ticket_type.price
  end
end