class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Mobylette::RespondToMobileRequests

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "hstove@gmail.com" && password == ENV['HANKSTOEVER_PASS']
    end
  end

end
