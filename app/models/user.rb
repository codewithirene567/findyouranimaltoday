class User < ApplicationRecord
    has_many :reasons
    has_many :animals, through: :reasons
    #has many animals is going to represent 
    has_secure_password
    #has_many :favorite_animals, through: :reasons, source: :animal

    validates :name, uniqueness: true
    validates :name, presence: true
    validates :password, presence: true
end