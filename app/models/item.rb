class Item < ApplicationRecord

  belongs_to :user
  attachment :item_image


  def self.looks(search, word)
    if word == ""
      @item = []
    elsif search == "perfect_match"
      @item = Item.where("name LIKE?","#{word}")
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%")
    else
      @item = Item.all
    end
  end



  enum status: {
    retention: 0, #保有
    lost: 1, #ロスト
    want: 2, #欲しい

  }
end
