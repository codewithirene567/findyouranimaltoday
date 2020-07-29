class User < ApplicationRecord
    has_many :animals 
    has_many :reasons
    has_many :favorite_animals, through: :reasons, source: :animal
end