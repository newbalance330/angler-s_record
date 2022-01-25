class HomesController < ApplicationController

  def top
     @fish = Fish.all
  end

  def about
     @fish = Fish.all
  end

end
