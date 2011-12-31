class AddWidthAndHeightToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_width, :integer
    add_column :products, :image_height, :integer
  end
end
