class Reason < ApplicationRecord
    belongs_to :user
    belongs_to :animal
    validates :words, presence: true
end