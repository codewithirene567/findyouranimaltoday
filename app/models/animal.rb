class Animal < ApplicationRecord
    has_many :reasons
    has_many :users, through: :reasons
    belongs_to :category
    
  
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :comment, presence: true

    scope :order_by_alphabetically, -> { order(name: :asc) }
    #to apply a scope method just put it as .chain at the end of a controller action

end
