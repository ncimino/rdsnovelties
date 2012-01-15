class LineItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @line_item = LineItem.create!(:cart => current_cart, :product => @product, :quantity => 1, :unit_price => @product.price)
    flash[:notice] = "Added #{@product.name} to cart."
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
    redirect_to current_cart
  end
end