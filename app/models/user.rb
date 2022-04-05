class User < ApplicationRecord
    has_many :mangas, dependent: :nullify

    enum :role, [:reader, :publisher, :admin]
end
