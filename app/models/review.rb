class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true
  validates :comment, presence: true
  validates :recommend, presence: true

  def self.order_by_date
    @review = Review.order('created_at DESC')
  end
  
end
