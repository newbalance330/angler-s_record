class FishFavoritesController < ApplicationController
  
  def create
    @fish = Fish.find(params[:fish_id])
    fish_favorite = current_user.fish_favorites.new(fish_id: @fish.id)
    fish_favorite.save
    # redirect_to fish_path(fish) 非同期通信に伴い削除  
  end

  def destroy
    @fish = Fish.find(params[:fish_id])
    fish_favorite = current_user.fish_favorites.find_by(fish_id: @fish.id)
    fish_favorite.destroy
    # redirect_to fish_path(fish)
  end
  
  
end
