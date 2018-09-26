class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :event, foreign_key: true
      t.datetime :start, null: false
      t.datetime :end, null: false

      t.timestamps
    end
  end
end
