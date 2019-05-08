class DislikesController < ApplicationController


  def index
    @dislikes = Dislike.all
    render json: @dislikes, status: :ok
  end

  def show
    @dislike = Dislike.find(params[:id])
    render json: @dislike, status: :ok
  end

  def create
      @dislike = Dislike.new(ingredient_params)
      if @dislike.save
          render json: @dislike, status: :created
      else
          render json: {errors: @dislike.errors.full_messages}, status: :unprocessable_entity
      end
  end

  def update
    @dislike = Dislike.find(params[:id])
    if @dislike.update
      render json: @dislike, status: :updated
    else
      render json: {errors: @dislike.errors.full_messages}, status: :unprocessable_entity
  end

  def destroy
      @dislike = Dislike.find(params[:id])
      @dislike.destroy
      render json: {success: "removed"}, status: :destroy
  end

  private
  def like_params
      params.permit(:drinkid, :userid)
  end



end
