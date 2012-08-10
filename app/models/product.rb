class Product < ActiveRecord::Base
  belongs_to :category

  mount_uploader :image, ImageUploader

  attr_accessible :name, :price, :released_at, :image, :description, :image_width, :image_height
  #, :category_id

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end