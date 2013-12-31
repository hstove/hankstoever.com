require 'spec_helper'

describe Customer do
  let(:customer) { build :customer }
  it "subscribes to mailchimp" do
    customer.should_receive(:subscribe_to_mailchimp)
    customer.save
  end
end
