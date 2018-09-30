json.transactions transactions do |transaction|
  json.id transaction.id
  json.customer_name transaction.customer_name
  json.customer_email transaction.customer_email
  json.total_price transaction.total_price
  
  json.transaction_details transaction.transaction_details do |transaction_detail|
    json.id transaction_detail.id
    json.ticket_type do
      json.id transaction_detail.ticket_type.id
      json.name transaction_detail.ticket_type.name
    end
    json.qty transaction_detail.qty
    json.price_n_qty transaction_detail.price_n_qty
  end
end