class User < ApplicationRecord
    require "securerandom"

    has_secure_password

    validates :email, presence: true
    validates :password, presence: true
    validates :nickname, presence: true, uniqueness: true

    has_many :user_mangas
    has_many :mangas, :through => :user_mangas
    
    enum :role, [:reader, :admin]
end
