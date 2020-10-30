class RemoveImageColourPriceFromUnit < ActiveRecord::Migration[6.0]
  def change
    remove_column :units, :image, :string
    remove_column :units, :colour, :string
    remove_column :units, :price, :string
  end
end
