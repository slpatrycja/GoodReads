class ApplicationController < ActionController::Base
    def self.provide_to_show
      @reviews = Review.where(book: @book)
      @rating = Rating.new(book: @book)
    end
end
