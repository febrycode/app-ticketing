# Assumptions

These are assumptions for this application:

1. Fields in every table is required
2. For create transaction, this is the JSON data template
```json
{
  "customer_name": "John Doe",
  "customer_email": "john.doe@test.com",
  "event_id": 1,
  "ticket_types": [
    {
      "id": 2,
      "qty": 4
    }
  ]
}
```
3. To check a customer only purchase ticket within same event for each transaction,
it used customer email
4. If a transaction, customer want to purchase more than 1 ticket type, this is the JSON data template
```json
{
  "customer_name": "John Doe",
  "customer_email": "john.doe@test.com",
  "event_id": 1,
  "ticket_types": [
    {
      "id": 1,
      "qty": 4
    },
    {
      "id": 2,
      "qty": 3
    }
  ]
}
```