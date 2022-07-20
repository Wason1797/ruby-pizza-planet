class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.references :orders, null: false, foreign_key: true
      t.references :ingredients, null: false, foreign_key: true
      t.float :ingredient_price

      t.timestamps
    end
  end
end
