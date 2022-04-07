class User < ApplicationRecord
    require "securerandom"

    has_secure_password

    validates :email, presence: true
    validates :password, presence: true
    validates :nickname, presence: true, uniqueness: true
    
    enum :role, [:reader, :admin]
end
