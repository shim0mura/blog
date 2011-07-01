class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def basic_authentication
    authenticate_or_request_with_http_basic do |user, pass|
      user = 'admin'
      pass = 'hoge'
    end
  end
end
