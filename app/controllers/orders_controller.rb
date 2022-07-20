class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders, methods: %i[_id date]
  end

  # GET /orders/1
  def show
    render json: @order, methods: %i[_id date detail], include: %i[size]
  end

  # POST /orders
  def create
    valid_params = order_params
    ingredients = Ingredient.where(id: order_params[:ingredients].map(&:to_i))
    valid_params[:total_price] = Order.calculate_price(ingredients, order_params[:size_id])
    @order = Order.new(valid_params.except(:ingredients))

    if @order.save
      Order.create_order_details(ingredients, @order)
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    order_params = params.require(:order).permit(
      :client_name,
      :client_dni,
      :client_address,
      :client_phone,
      :size_id
    )
    order_params[:ingredients] = params[:ingredients]
    order_params
  end
end
