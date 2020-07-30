class Animal < ApplicationRecord
    #belongs_to :user
    has_many :reasons
    has_many :users, through: :reasons
    accepts_nested_attributes_for :reasons
end
