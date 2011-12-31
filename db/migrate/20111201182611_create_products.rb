class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.decimal :price, :scale => 2
      t.text :description

      t.timestamps
    end
  end
end
