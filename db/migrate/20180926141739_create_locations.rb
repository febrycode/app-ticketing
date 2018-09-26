class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.references :event, foreign_key: true
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :phone_number

      t.timestamps
    end
  end
end
