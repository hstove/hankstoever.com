# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    posted_at "2013-06-06 17:42:57"
    body "MyText"
    published false
  end
end
