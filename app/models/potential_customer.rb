class PotentialCustomer < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :mobile, :payment_method

  validates :email, :presence => false # , :email => true
  validates :mobile, :presence => true
  validates :password, :presence => true, :on => :create
  validates :payment_method, :presence => true

end
