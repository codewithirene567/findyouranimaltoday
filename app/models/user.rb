class User < ApplicationRecord
    has_many :animals
    has_many :received_featurerequesteds, through: animals, source: :featurerequesteds
    has_many :featurerequesteds
    has_many :featurerequested_for_animals, through: :featurerequesteds, source: :animal
end