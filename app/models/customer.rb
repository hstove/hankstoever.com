class Customer < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email
  include QueueHelpers

  after_create do
    mailer(CustomerMailer, :new_customer, self.email)
    mailer(CustomerMailer, :digest, self.email) if self.subscribed
  end

  def subscribed?
    self.subscribed
  end
  
end
