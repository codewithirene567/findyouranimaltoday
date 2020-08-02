class User < ApplicationRecord
    has_many :reasons
    has_many :animals, through: :reasons
    #has many animals is going to represent 
    has_secure_password
    #has_securepassword has a validation for password presence
    #has_many :favorite_animals, through: :reasons, source: :animal

    #validates :name, uniqueness: true
    validates :name, presence: true
    #validates :password, presence: true
    def self.create_from_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.name = auth['info']['first_name']
            u.password = SecureRandom.hex(16)
        end
    end
end