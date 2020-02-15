class BoardsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index  
  end

  def new
    @board = Board.new
  end
  
  def create
    Board.create(board_params)
  end
  
  def edit
  end
  
  def update
  end

  private
  def board_params
    params.require(:board).permit( :title, :image, :text).merge(user_id: current_user.id)
    
  end
  

  

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
