class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :category
      t.string :style
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
