class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end

  def basic_http_authentication
    authenticate_or_request_with_http_basic do |user, password|
      user == "never" && password == "4ever"
    end
  end

end
