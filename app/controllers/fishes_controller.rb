class FishesController < ApplicationController

  def new
    @fish = Fish.new
  end


  def create
    @fish = Fish.new(fish_params)
    @fish.user_id = current_user.id
    if @fish.save
      redirect_to fish_path(@fish), notice: "You have created fish successfully."
    else
      @fish = Fish.all
      render 'index'
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private

   def fish_params
    params.require(:fish).permit(:image, :fish_name, :lure, :body)

   end

end
