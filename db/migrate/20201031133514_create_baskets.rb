class CreateBaskets < ActiveRecord::Migration[6.0]
  def change
    create_table :baskets do |t|
      t.string :uuid
      t.integer :subtotal
      t.integer :discount
      t.integer :total

      t.timestamps
    end
  end
end
