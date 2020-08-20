class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true
  validates :comment, presence: true
  validates :recommend, presence: true
end
