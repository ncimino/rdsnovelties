# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  helper_method :admin?, :current_cart
  protect_from_forgery

  def current_cart
    #logger.debug "The session[:cart_id]: #{session[:cart_id]}"
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      #logger.debug "The @current_cart: #{@current_cart}"
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    #logger.debug "The @current_cart: #{@current_cart}"
    @current_cart

    #session[:cart_id] ||= Cart.create!.id
    #session[:cart_id] ||= nil
    #@current_cart ||= Cart.find(session[:cart_id])
    #@current_cart ||= Cart.find_or_create_by_id(session[:cart_id])
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