class Reason < ApplicationRecord
    belongs_to :user
    belongs_to :animal
    accepts_nested_attributes_for :animal
end