# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :post do
    posted_at "2013-06-06 17:42:57"
    body "MyText"
    published false
  end
end
