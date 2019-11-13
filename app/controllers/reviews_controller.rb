class ReviewsController < ApplicationController
  def new
    set_rest
    @review = Review.new
  end

  def create
    set_rest
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_rest
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
