class User < ApplicationRecord
    validates :name, presence: true, length: {maximum:15}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    
    VALID_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,32}+\z/
    validates :password, presence: true, format: { with: VALID_REGEX }
    #validates :password_confirmation, presence: true, format: { with: VALID_REGEX }
    validate :valid_password_confirmation

    has_secure_password
    
    has_many :candleSticks

    private
    
    def valid_password_confirmation
        if password_confirmation.blank?
            errors.add(:password_confirmation, "can't be blank")
        end
    end
end
