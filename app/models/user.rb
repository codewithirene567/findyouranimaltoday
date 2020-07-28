class User < ApplicationRecord
    has_many :animals 
    has_many :reasons
    has_many :reason_animals, through: :reasons, source: :animal
end