class RatingsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @rating = @book.ratings.create(rating_params)
    redirect_to @book
  end

  private

  def rating_params
    params.permit(:number).merge(book: @book)
  end
end
