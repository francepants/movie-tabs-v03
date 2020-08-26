class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews

    has_secure_password 

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true



    def self.find_or_create_from_omniauth(user_info)
        User.find_or_create_by(uid: user_info[:uid]) do |user|
            user.email = user_info["info"]["email"]
            user.username = user_info["info"]["name"]
            user.password = SecureRandom.hex
        end
    end
end
