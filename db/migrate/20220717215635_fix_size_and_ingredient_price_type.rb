class FixSizeAndIngredientPriceType < ActiveRecord::Migration[7.0]
  def change
    change_column :ingredients, :price, :float
    change_column :sizes, :price, :float
    change_column_null :ingredients, :price, false
    change_column_null :sizes, :price, false
  end
end
