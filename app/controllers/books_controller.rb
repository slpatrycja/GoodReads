class BooksController < ApplicationController
  def index
    if params[:search]
        @books = Book.search(params[:search])
        if params[:order]
          @books = @books.sort_by { |book| sort_by_order_params(book)}
        end
    elsif params[:order]
        @books = Book.all.sort_by { |book| sort_by_order_params(book)}
    else
      @books = Book.all.order("created_at DESC")
    end
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new(book: @book)
    provide_to_show(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to books_path
  end
  def top_books
    @books = Book.all.sort_by { |book| -(book.avg_rate) }.first(10)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

  def provide_to_show(_book)
    @reviews = Review.where(book: _book)
    @rating = Rating.new(book: _book)
  end

  def sort_by_order_params(book)
    if params[:order] == 'asc'
      book.avg_rate
    elsif params[:order] == 'desc'
      -(book.avg_rate)
    end
  end
end
