class Author < ApplicationRecord
    has_many :mangas, dependent: :nullify
end
