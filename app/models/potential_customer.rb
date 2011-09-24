class PotentialCustomer < ActiveRecord::Base
  validates :email, :presence => true, :email => true
end
