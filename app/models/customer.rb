class Customer < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email

  after_create do
    CustomerMailer.new_customer(self.email).deliver
  end
end
