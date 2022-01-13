class Item < ApplicationRecord

  belongs_to :user
  attachment :item_image
  
  enum status: {
    retention: 0, #保有
    lost: 1, #ロスト
    want: 2, #欲しい
    
  }
end
