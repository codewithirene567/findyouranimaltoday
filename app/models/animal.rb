class Animal < ApplicationRecord
    belongs_to :user
    has_many :featurerequesteds
    has_many :users, through: :featurerequesteds
end