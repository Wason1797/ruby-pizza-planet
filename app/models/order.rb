class Order < ApplicationRecord
  has_many :order_details
  has_many :ingredients, through: :order_details, class_name: 'Ingredient'
  belongs_to :size

  def _id
    self[:id]
  end

  def date
    self[:created_at]
  end

  def detail
    order_details.map { |detail| { ingredient: detail.ingredient, ingredient_price: detail.ingredient_price } }
  end

  def self.calculate_price(ingredients, size_id)
    ingredients_total = ingredients.reduce(0) { |sum, ingredient| sum + ingredient.price }
    size_price = Size.find(size_id.to_i).price
    ingredients_total + size_price
  end

  def self.create_order_details(ingredients, order)
    OrderDetail.insert_all(
      ingredients.map do |ingredient|
        { order_id: order.id, ingredient_id: ingredient.id, ingredient_price: ingredient.price }
      end
    )
  end
end
