class Reason < ApplicationRecord
    belongs_to :user
    belongs_to :animal

    
    def self.find_the_user_id(user)
        self.where(user_id: user.id)
    end
end