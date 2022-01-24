class HomesController < ApplicationController

  def top
     @fish = Fish.all
  end

  def about
  end

end
