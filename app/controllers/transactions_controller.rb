class TransactionsController < ApplicationController
  def index
    transactions = Transaction.all

    render 'index', locals: { transactions: transactions }
  end
  
  def create
    transaction_service = TransactionCreationService.new(params).call

    if !transaction_service[:error]
      render json: { message: transaction_service[:message] }, status: :created
    else
      render json: { message: transaction_service[:message] }, status: 422
    end
  end
end