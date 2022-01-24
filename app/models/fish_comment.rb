class FishComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :fish

  validates :comment, presence: true
end
