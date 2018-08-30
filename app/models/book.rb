class Book < ApplicationRecord
  has_many :reviews
  has_many :ratings

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :description, presence: true

  def self.search(search)
    where("title ILIKE :q OR author ILIKE :q", q: "%#{search.downcase}%")
  end

  def avg_rate
    if self.ratings.count != 0
      return ('%.2f' % self.ratings.average(:number)).to_f
    else
      0
    end
  end
end
