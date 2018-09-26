class CreateTicketTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_types do |t|
      t.references :event, foreign_key: true
      t.string :name, null: false
      t.integer :quota, null: false
      t.decimal :price, precision: 19, scale: 4, null: false

      t.timestamps
    end
  end
end
