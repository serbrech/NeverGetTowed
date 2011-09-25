class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :string
    add_column :users, :payment_method, :string
  end
end
