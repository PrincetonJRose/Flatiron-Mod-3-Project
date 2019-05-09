class DrinkIngredientsController < ApplicationController

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
        params.permit(:user_id, :drink_id)
    end
  
end
