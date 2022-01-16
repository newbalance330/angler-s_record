class FishController < ApplicationController

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

  def show
    @fish = Fish.find(params[:id])
    @fish_comment = FishComment.new
    @user = @fish.user

  end

  def index
    @fish = Fish.all
  end

  def edit
    @fish = Fish.find(params[:id])
  end

  def update
    fish = Fish.find(params[:id])
    fish.update(fish_params)
    redirect_to fish_path(fish.id)
  end

  def destroy
    fish = Fish.find(params[:id])
    fish.destroy
    redirect_to fish_index_path
  end


  private

   def fish_params
    params.require(:fish).permit(:image, :fish_name, :lure, :body)

   end

end
