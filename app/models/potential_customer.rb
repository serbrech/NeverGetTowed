class PotentialCustomer < ActiveRecord::Base
  validates :email, :presence => false, :email => true
  validates :mobile, :presence => true ###, :mobil => true
  validates :password, :presence => true #, :password => true
  validates :payment_method, :presence => true #, :presence => true
end
