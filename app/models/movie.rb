class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    validates :title, presence: true, uniqueness: true
    validates :length, presence: true
    validates :genre, presence: true
    validates :rating, presence: true
    validates :release_year, presence: true

    scope :sorted_movies, -> {order(:title)}
    scope :search, -> (term) {self.sorted_movies.where("title LIKE ?", "%#{term}%")}

end
