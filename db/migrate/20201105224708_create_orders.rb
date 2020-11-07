class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :total
      t.string :status
      t.datetime :shipped_date
      t.datetime :delivered_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
