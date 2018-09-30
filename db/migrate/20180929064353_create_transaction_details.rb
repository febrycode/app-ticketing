class CreateTransactionDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_details do |t|
      t.references :transaction, foreign_key: true, null: false
      t.references :ticket_type, foreign_key: true, null: false
      t.integer :qty, null: false, default: 0
      t.decimal :price_n_qty, precision: 19, scale: 4, null: false, default: 0 

      t.timestamps
    end
  end
end
