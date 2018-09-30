class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :customer_name, null: false
      t.string :customer_email, null: false
      t.references :event, foreign_key: true
      t.decimal :total_price, precision: 19, scale: 4, null: false, default: 0
      t.timestamps
    end
  end
end
