class SpotsController < ApplicationController
  def index
  end

  def show
  end

  def spot
    results = Geocoder.search(params[:name])
    @latlng = results.first.coordinates

    respond_to do |format|
      format.js
    end
  end
  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # spot.js.erbが変えるようになります。
end
