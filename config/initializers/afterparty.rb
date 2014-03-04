queue = Rails.configuration.queue = Afterparty::Queue.new

queue.config_login do |username, password|
  username == "hstove@gmail.com" && password == ENV['HANKSTOEVER_PASS']
end
