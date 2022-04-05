class Publisher < ApplicationRecord
    has_many :mangas, dependent: :nullify
end
