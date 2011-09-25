class AddFieldsToPotentialCustomer < ActiveRecord::Migration
  def change
    add_column :potential_customers, :mobile, :string
    add_column :potential_customers, :password, :string
    add_column :potential_customers, :payment_method, :string
  end
end
