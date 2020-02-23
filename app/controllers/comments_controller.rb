class CommentsController < ApplicationController
    before_action :set_board
  def create
    @comment = Comment.create(comment_params)
    # binding.pry
    if @comment.save
      redirect_to board_path(@board), notice: 'コメントが投稿されました'
    else
      render "boards/show"
    end
  end
  
  # def edit
  #   # @comment = Comment.new
  #   @comment = Comment.find(params[:id])
  #   @comments = @board.comments.includes(:user)
  #   # if @comments.user_id == current_user.id
  #   # else  
  #   #   redirect_to board_path
  #   # end      
  # end
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
    redirect_to board_path (@board), notice: '削除されました'
    end
    
  end
  
  
  # def update
  #   binding.pry
  #   @comment.update(comment_params)
  #   redirect_to root_path

  # end
  



  private 
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, board_id: params[:board_id])
  end

  def set_board
    @board = Board.find(params[:board_id])
  end
  
  
  
end
