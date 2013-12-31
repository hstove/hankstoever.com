Rails.configuration.mailchimp = Gibbon::API.new(ENV['MAILCHIMP_KEY'])

if Rails.env.test?
  Gibbon::Export.api_key = "fake"
  Gibbon::Export.throws_exceptions = false
end