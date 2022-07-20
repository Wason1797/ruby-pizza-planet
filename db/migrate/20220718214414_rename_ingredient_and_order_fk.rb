class RenameIngredientAndOrderFk < ActiveRecord::Migration[7.0]
  def change
    rename_column :order_details, :ingredients_id, :ingredient_id
    rename_column :order_details, :orders_id, :order_id
  end
end
