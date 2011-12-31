class SessionsController < ApplicationController
  require "digest"
  def create
    #session[:password] = params[:password]
    session[:password] = Digest::MD5.hexdigest(Digest::MD5.hexdigest('lkj@#%kaf;lk^$%&*$%') + params[:password])
    if admin?
      flash[:notice] = "Successfully logged in"
      redirect_to root_path
    else
      flash[:error] = "Incorrect log in"
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Successfully logged out"
    redirect_to login_path
  end
end
