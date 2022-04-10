class Manga < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :publisher, optional: true

  has_many :volumes, dependent: :nullify

  def self.search_title(query)
    query = "%#{query}%"
    Manga.where("original_title like ? or en_title like ? or pt_title like ?", query, query, query)
  end
end
