class CreatePlannedEvents < ActiveRecord::Migration
  def change
    create_table :planned_events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.text :comment
      t.integer :street_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
