class Manga < ApplicationRecord
  belongs_to :author
  belongs_to :user

  has_many :volumes, dependent: :nullify
end
