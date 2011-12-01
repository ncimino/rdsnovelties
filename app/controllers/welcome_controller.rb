class WelcomeController < ApplicationController
  def index
    @images = (1..19).collect {|i| "t" + String(i) + ".png" }
    @show_images = @images.slice(0,5)
    @hidden_images = @images.slice(5,14)
  end

end
