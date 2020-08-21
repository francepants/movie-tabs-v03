class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    has_secure_password #authenticate, validates password

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true


    def self.find_or_create_from_omniauth(user_info)
        binding.pry
        User.first_or_create(uid: user_info[:uid]) do |user|
            user.email = user_info["info"]["email"]
            user.password = SecureRandom.hex
        end
    end
end
