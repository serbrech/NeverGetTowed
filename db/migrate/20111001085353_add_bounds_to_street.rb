class AddBoundsToStreet < ActiveRecord::Migration
  def change
    add_column :streets, :northeast_lat, :float
    add_column :streets, :northeast_lng, :float
    add_column :streets, :southwest_lat, :float
    add_column :streets, :southwest_lng, :float
    add_column :streets, :address_components, :string
  end
end
