class Fish < ApplicationRecord

  belongs_to :user
  has_many :fish_comments, dependent: :destroy
  has_many :fish_favorites, dependent: :destroy
  has_many :spots, dependent: :destroy

  attachment :image
  
  def fish_favorited_by?(user)
    fish_favorites.where(user_id: user.id).exists?
  end
  
end