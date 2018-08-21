class ReviewsController < ApplicationController

  def create
    @book = Book.find(params[:review][:book_id])
    @review =  @book.reviews.new(review_params)

    if @review.save
      redirect_to @book
    else
      render 'error_message'
    end
  end

  private

  def review_params
    params.require(:review).permit(:nick, :body)
  end

end
