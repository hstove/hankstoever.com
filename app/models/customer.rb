class Customer < ActiveRecord::Base
  after_create do
    CustomerMailer.digest(self.email).deliver
  end
end
