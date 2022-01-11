class Fishes < ApplicationRecord

  belongs_to :user
  has_many :fish_comments, dependent: :destroy
  has_many :fish_favorites, dependent: :destroy
  has_many :spots, dependent: :destroy

end