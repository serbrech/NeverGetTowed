class DropUsername < ActiveRecord::Migration
  def up
    remove_column :users, :username
    change_column :users, :email, :string, :unique => true , :null => false
  end

  def down
  end
end
