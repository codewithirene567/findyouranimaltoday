class User < ApplicationRecord
    has_many :reasons
    has_many :animals, through: :reasons
    #has_many :favorite_animals, through: :reasons, source: :animal

    
end