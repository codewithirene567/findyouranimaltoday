class Category < ApplicationRecord
    has_many :animals
    validates :value, presence: true
end