class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
    render json: @ingredients, status: :ok
  end

  def show
    @ingredients = Ingredient.find(params[:id])
    render json: @ingredients, status: :ok
  end

  def create
      @ingredient = Ingredient.new(ingredient_params)
      if @ingredient.save
          render json: @ingredient, status: :created
      else
          render json: {errors: @ingredient.errors.full_messages}, status: :unprocessable_entity
      end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update
      render json: @ingredient, status: :updated
    else
      render json: {errors: @ingredient.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
      @ingredient = Ingredient.find(params[:id])
      @ingredient.destroy
      render json: {success: "removed"}, status: :destroy
  end

  private
  def ingredient_params
      params.permit(:id_ingredient, :name, :category, :description, :imageURL)
  end


end

