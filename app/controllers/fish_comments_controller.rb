class FishCommentsController < ApplicationController
  
 def create
    fish = Fish.find(params[:fish_id])
    comment = current_user.fish_comments.new(fish_comment_params)
    comment.fish_id = fish.id
    comment.save
    redirect_to fish_index_path(fish)
 end

  def destroy
     FishComment.find_by(id: params[:id]).destroy
    redirect_to fish_index_path(params[:post_image_id])
  end

  private

  def fish_comment_params
    params.require(:fish_comment).permit(:comment)
  end

end
