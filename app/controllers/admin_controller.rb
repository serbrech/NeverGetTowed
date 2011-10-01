class AdminController < ApplicationController
  before_filter :basic_http_authentication  # :only => :index

  def index
    @users = User.find(:all,{:order => "created_at desc" })
  end

end
