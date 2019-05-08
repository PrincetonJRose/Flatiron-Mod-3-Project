class DrinksController < ApplicationController

  def index
          @drink = Drink.all
          render json: @drinks, status: :ok
  end

  def show
      @drink = Drink.find(params[:id])
      render json: @drink, status: :ok
  end

  def create
      @drink = Drink.new(drink_params)
      if @drink.save
          render json: @drink, status: :created
      else
          render json: {errors: @drink.errors.full_messages}, status: :unprocessable_entity
      end
  end

  def destroy
      @drink = Drink.find(params[:id])
      @drink.destroy
      render json: {success: "removed"}, status: :destroy
  end

  private

  def drink_params
      params.permit(
        :id_drink,
        :name,
        :instructions,
        :category,
        :alcoholic,
        :glass,
        :videoURL,
        :imageURL,
        :ingredientid_1,
        :ingredientid_2,
        :ingredientid_3,
        :ingredientid_4,
        :ingredientid_5,
        :ingredientid_6,
        :ingredientid_8,
        :ingredientid_9,
        :ingredientid_10,
        :ingredientid_11,
        :ingredientid_12,
        :ingredientid_13,
        :ingredientid_14,
        :ingredientid_15,
        :measure1,
        :measure2,
        :measure3,
        :measure4,
        :measure5,
        :measure6,
        :measure7,
        :measure8,
        :measure9,
        :measure10,
        :measure11,
        :measure12,
        :measure13,
        :measure14,
        :measure15,
        :userid,
        :created_at,
        :updated_at)
  end

end
