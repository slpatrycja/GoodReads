class Book < ApplicationRecord
  def self.search(search)
    where("title ILIKE :q OR author ILIKE :q", q: "%#{search.downcase}%")
  end

  has_many :reviews
end
