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
  end

  def sort_asc
      @books = Book.all.sort_by { |book| book.avg_rate }
    if params[:search]
      @books = Book.search(params[:search]).sort_by { |book| book.avg_rate }
    else
      @books = Book.all.sort_by { |book| book.avg_rate }
    end
    render 'index'
  end

  def sort_desc
      @books = Book.all.sort_by { |book| -(book.avg_rate) }
    if params[:search]
      @books = Book.search(params[:search]).sort_by { |book| -(book.avg_rate) }
    else
      @books = Book.all.sort_by { |book| -(book.avg_rate) }
    end
    render 'index'
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

end
