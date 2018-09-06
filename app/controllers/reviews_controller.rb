class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review =  @book.reviews.new(review_params)
    provide_to_show(@book)

    if @review.save
      redirect_to @book
    else
      render 'books/show'
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @review.destroy!

    redirect_to @book
  end

  private

  def review_params
    params.require(:review).permit(:nick, :body).merge(book: @book)
  end

  def provide_to_show(_book)
    @reviews = Review.where(book: _book)
    @rating = Rating.new(book: _book)
  end

end
