class Customer < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email
  include QueueHelpers

  scope :subscribers, -> { where('subscribed = ?', true)}

  after_create do
    mailer(CustomerMailer, :new_customer, self.email)
    mailer(CustomerMailer, :bitcoin_class, self.email)
    mailer(CustomerMailer, :digest, self.email) if self.subscribed
  end

  def subscribed?
    self.subscribed
  end

  def self.email_blast! name
    subscribers.each do |c|
      mailer(CustomerMailer, name, c.email)
    end
  end

end
