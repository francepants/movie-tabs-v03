class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    has_secure_password #authenticate, validates password
end
