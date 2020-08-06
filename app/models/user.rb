class User < ApplicationRecord
    has_many :reasons
    has_many :animals, -> { distinct }, through: :reasons
    has_secure_password
    #has_secure_password has a validation for password presence
    validates :name, presence: true

    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['first_name']
            u.password = SecureRandom.hex(16)
        end
    end

end