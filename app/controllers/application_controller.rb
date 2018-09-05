class ApplicationController < ActionController::Base
  before_action :authenticate_user!
    def self.provide_to_show
      @reviews = Review.where(book: @book)
      @rating = Rating.new(book: @book)
    end
end
