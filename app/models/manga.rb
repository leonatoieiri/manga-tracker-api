class Manga < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :publisher, optional: true

  has_many :volumes, dependent: :nullify
end
