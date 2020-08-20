class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    scope :sorted_movies, -> {order(:title)}
    scope :search, -> (term) {self.sorted_movies.where("title LIKE ?", "%#{term}%")}

end
