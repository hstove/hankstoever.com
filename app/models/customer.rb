class Customer < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email


  after_create do
    CustomerMailer.new_customer(self.email).deliver
    CustomerMailer.digest(self.email).deliver if self.subscribed
  end

  def subscribed?
    self.subscribed
  end
  
end
