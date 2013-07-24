class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include QueueHelpers
  helper_method :is_admin?

  include Mobylette::RespondToMobileRequests

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      if username == "hstove@gmail.com" && password == ENV['HANKSTOEVER_PASS']
        session[:admin] = true
      end
      session[:admin]
    end
  end

  def is_admin?
    session[:admin] == true
  end

end
