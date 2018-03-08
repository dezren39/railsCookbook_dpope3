class AdminController < ApplicationController  
before_action :authenticate

  def index
    @title = 'index'
  end

private
  def authenticate
    if user = authenticate_with_http_basic {|user, password| User.authenticate(user, password)}
    session[:user_id] = user.id
    session[:logged_in] = true else
    request_http_basic_authentication
    end
  end
end