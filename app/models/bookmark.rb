class Bookmark < ApplicationRecord
  has_one_attached :photo
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  validates :movie_id, presence: true, uniqueness: { scope: :list_id }
  validates :list_id, presence: true
end
