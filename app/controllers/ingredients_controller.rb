class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show destroy]
  before_action :set_ingredient_for_update, only: %i[update]

  # GET /ingredients
  def index
    @ingredients = Ingredient.all

    render json: @ingredients, methods: [:_id]
  end

  # GET /ingredients/1
  def show
    render json: @ingredient, methods: [:_id]
  end

  # POST /ingredients
  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient, status: :created, location: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ingredients/1
  def update
    if @ingredient.update(update_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ingredients/1
  def destroy
    @ingredient.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def set_ingredient_for_update
    @ingredient = Ingredient.find(params[:_id])
  end

  # Only allow a list of trusted parameters through.
  def ingredient_params
    params.require(:ingredient).permit(:name, :price)
  end

  def update_params
    params.require(:ingredient).permit(:_id, :name, :price)
  end
end
