# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Rails.logger = Logger.new(STDOUT)

(1..19).each do |i|
  product = Product.create!(:name => "This is product #{i}", :price => '20', :description => "This is product #{i}")
  product.image = ImageUploader.new
  product.image.store!(File.open(File.join(Rails.root, "/app/assets/images/t#{i}.png")))
  Rails.logger.debug "(DEBUG) image: #{product.image}"

  Rails.logger.debug "(DEBUG) product: #{product}"
  product.save!
end






