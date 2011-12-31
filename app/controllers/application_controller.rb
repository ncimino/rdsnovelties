# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  helper_method :admin?

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '526292d4095d0fd8135a9aa118f5956e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  #filter_parameter_logging :password
  
  def current_cart
    session[:cart_id] ||= Cart.create!.id
    @current_cart ||= Cart.find(session[:cart_id])
  end

  protected

  def admin?
    session[:password] == 'b7df50c78e39835e01c7dca50a101aa3'
    #session[:password] = md5(md5(salt) + session[:password])
  end

  def authorize
    unless admin?
      flash[:error] = "Unauthorized access"
      redirect_to root_path
      false
    end
  end
end