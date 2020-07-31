class Animal < ApplicationRecord
    #belongs_to :user
    has_many :reasons
    has_many :users, through: :reasons
    accepts_nested_attributes_for :reasons

    scope :order_by_alphabetically, -> { order(name: :asc) }
    #to apply a scope method just put it as .chain at the end of a controller action

end
