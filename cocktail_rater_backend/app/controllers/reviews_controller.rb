class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render json: @reviews, status: :ok
  end

  def show
    @review = Review.find(params[:id])
    render json: @review, status: :ok
  end

  def create
      @review = Review.new(review_params)
      if @review.save
          render json: @review, status: :created
      else
          render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
      end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update
      render json: @review, status: :updated
    else
      render json: {errors: @review.errors.full_messages}, status: :unprocessable_entity
  end

  def destroy
      @review = Review.find(params[:id])
      @review.destroy
      render json: {success: "removed"}, status: :destroy
  end

  private
  def review_params
      params.permit(:drinkid, :userid, :review)
  end


end
