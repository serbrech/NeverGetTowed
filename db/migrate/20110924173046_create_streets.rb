class CreateStreets < ActiveRecord::Migration
  def change
    create_table :streets do |t|
      t.string :streetname
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
