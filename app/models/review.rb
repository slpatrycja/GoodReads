class Review < ApplicationRecord
  belongs_to :book

  validates :nick, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
end
