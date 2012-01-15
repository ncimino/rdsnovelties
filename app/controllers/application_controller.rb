# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  helper_method :admin?, :current_cart

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '526292d4095d0fd8135a9aa118f5956e'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  #filter_parameter_logging :password
  
  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
    #session[:cart_id] ||= Cart.create!.id
    #@current_cart ||= Cart.find(session[:cart_id])
  end

  protected

  def admin?
    session[:password] == APP_CONFIG[:encrypted_password]
  end

  def authorize
    unless admin?
      flash[:error] = "Unauthorized access"
      redirect_to root_path
      false
    end
  end
end