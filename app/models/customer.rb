class Customer < ActiveRecord::Base
  validates_uniqueness_of :email
  
  after_create do
    CustomerMailer.digest(self.email).deliver
  end
end
