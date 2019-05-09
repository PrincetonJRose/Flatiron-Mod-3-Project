class LikesController < ApplicationController


  def index
    @likes = Like.all
    render json: @likes, status: :ok
  end

  def show
    @likes = Like.find(params[:id])
    render json: @like, status: :ok
  end

  def create
      @like = Like.new(ingredient_params)
      if @like.save
          render json: @like, status: :created
      else
          render json: {errors: @like.errors.full_messages}, status: :unprocessable_entity
      end
  end

  def update
    @like = Like.find(params[:id])
    if @like.update
      render json: @like, status: :updated
    else
      render json: {errors: @like.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
      @like = Like.find(params[:id])
      @like.destroy
      render json: {success: "removed"}, status: :destroy
  end

  private
  def like_params
      params.permit(:drinkid, :userid)
  end


end
