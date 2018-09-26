class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :event, foreign_key: true
      t.text :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :country, null: false
      t.string :postal_code, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
