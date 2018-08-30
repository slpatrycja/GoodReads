class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:review][:book_id])
    @review =  @book.reviews.new(review_params)
    provide_to_show(@book)

    if @review.save
      redirect_to @book
    else
      render 'books/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:nick, :body)
  end

  def provide_to_show(book)
    @book = book
    @reviews = Review.where(book: @book)
    @rating = Rating.new(book: @book)
  end

end
