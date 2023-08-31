class ReviewsController < ApplicationController
  # before_action :set_restaurant, only: %i[new create]

  # def new
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review = Review.new
  #   # raise
  # end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    # "review "belongs a particular restaurant
    @review.restaurant = @restaurant
    @review.save
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # redirect_to restaurant_path(@restaurant)
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  # to delete all reviews
  # rails console -> Review.destroy_all
  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
