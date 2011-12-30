class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
    #session[:password] = md5(md5('lkj@#%kaf;lk^$%&*$%') + params[:password])
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
