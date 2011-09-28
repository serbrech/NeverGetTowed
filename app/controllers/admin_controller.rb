class AdminController < ApplicationController
  # before_filter :require_login, :only => :index
  before_filter :authentication_check

  def index
    @users = User.find(:all,{:order => "created_at desc" })
  end

private

  def authentication_check
    authenticate_or_request_with_http_basic do |user, password|
      user == "never" && password == "4ever"
    end
  end

end
