class TransactionCreationService

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    old_transaction = Transaction.find_by_customer_email(params["customer_email"])

    if old_transaction && old_transaction.event_id != params["event_id"].to_i
      return { error: true, message: "Customer only purchase ticket within same event" }
    end

    Transaction.transaction do
      transaction = Transaction.create(transaction_params)

      total_price = 0

      ticket_types.each do |ticket|
        begin
          ticket_type_find = TicketType.find(ticket["id"])
        rescue ActiveRecord::RecordNotFound => e
          @return_value = { error: true, message: e.message }
          raise ActiveRecord::Rollback
        end

        t_detail = TransactionDetail.new(
          transaction_id: transaction.id,
          ticket_type_id: ticket_type_find.id,
          qty: ticket["qty"].to_i,
          price_n_qty: ticket_type_find.price * ticket["qty"].to_i
        )

        if !t_detail.valid?
          @return_value = { error: true, message: t_detail.custom_full_messages }
          raise ActiveRecord::Rollback
        else
          ticket_type_find.quota = ticket_type_find.quota - ticket["qty"].to_i
          ticket_type_find.save
          t_detail.save

          total_price += (ticket_type_find.price * ticket["qty"].to_i)
        end
      end

      transaction.total_price = total_price
      transaction.save

      @return_value = { error: false, message: 'Data has been created successfully' }
    end

    return @return_value
  end

  private

  def ticket_types
    params["ticket_types"]
  end

  def transaction_params
    params.permit(
      :customer_name,
      :customer_email,
      :event_id
    )
  end
end