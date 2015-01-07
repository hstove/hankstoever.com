class Customer < ActiveRecord::Base
  validates_presence_of :email
  validates_uniqueness_of :email
  include QueueHelpers

  scope :subscribers, -> { where('subscribed = ?', true)}

  after_create do
    # mailer(CustomerMailer, :new_customer, self.email)
    # mailer(CustomerMailer, :bitcoin_class, self.email)
    # mailer(CustomerMailer, :digest, self.email) if self.subscribed
    subscribe_to_mailchimp
  end

  def subscribed?
    self.subscribed
  end

  def self.email_blast! name
    subscribers.each do |c|
      mailer(CustomerMailer, name, c.email)
    end
  end

  def subscribe_to_mailchimp
    list_id = ENV['MAILCHIMP_LIST_ID']
    merge_vars = {
      'HANDBOOK' => handbook,
    }

    response = Rails.configuration.mailchimp.lists.subscribe({
      id: list_id,
      email: {email: email},
      merge_vars: merge_vars,
      send_welcome: true,
    })
    response
  end

end
