class AddImageColourPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image, :string
    add_column :products, :colour, :string
    add_column :products, :price, :string
  end
end
