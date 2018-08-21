class BooksController < ApplicationController

  def index
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC")
    else
      @books = Book.all.order("created_at DESC")
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new(book: @book)
    @reviews = Review.where(book: @book)

    @rating = Rating.new(book: @book)
    avg_rate(@book)

  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

  def avg_rate(book)
    @avg_rate = if book.ratings.count != 0
      '%.2f' % book.ratings.average(:number).to_f
    else
      0
    end
    @avg_rate
  end
end
