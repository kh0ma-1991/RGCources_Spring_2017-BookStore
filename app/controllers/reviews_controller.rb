class ReviewsController < ApplicationController
  def create
    Review.create(review_params)
    redirect_back fallback_location: root_path
  end

  private
  def review_params
    params.require(:review)
      .permit(:book_id,
              :rating,
              :title,
              :text)
      .merge(user: current_user)
  end
end
