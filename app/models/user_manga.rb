class UserManga < ApplicationRecord
  belongs_to :manga
  belongs_to :user
end
