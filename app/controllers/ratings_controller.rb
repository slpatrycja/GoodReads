class RatingsController < ApplicationController

  def create
    @book = Book.find(params[:rating][:book_id])
    @rating = @book.ratings.create(rating_params)
    redirect_to @book
  end

  private

  def rating_params
    params.permit(:number)
  end
end
