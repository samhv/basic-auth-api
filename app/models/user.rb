class User < ApplicationRecord
    VALID_PASSWORD_REGEX = /\A
        (?=.*[A-Za-z]) # At least one letter
        (?=.*\d)       # At least one number
        (?=.*[!@#$%^&*()_+{}\[\]:;<>,.?]) # At least one special character
    /x

    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, presence: true, length: { minimum: 8 }, format: { with: VALID_PASSWORD_REGEX }
end
