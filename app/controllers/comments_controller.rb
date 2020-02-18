class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    # binding.pry
    comment.save!
    redirect_to root_path
  end
  



  private 
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, board_id: params[:board_id])
  end
  
end
