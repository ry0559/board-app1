class BoardsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index  
    @boards = Board.all.includes(:user).order("id ASC")
  
  
  end

  def new
    @board = Board.new
  end
  
  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to root_path, notice: '板が作成されました'
    else
      flash.now[:alert] = '入力してください'
      render :new
    end
  end
  def show
    @board = Board.find(params[:id])
    
  end
  
  def edit
    @board = Board.find(params[:id])
    if @board.user_id == current_user.id
    else
      redirect_to root_path
    end
  end
  
  def update
    @board = Board.find(params[:id])
    if @board.user_id == current_user.id
      @board.update(board_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if @board.user_id == current_user.id
    @board.delete
    redirect_to root_path
    else
      redirect_to root_path
    end
  end
  

  private
  def board_params
    params.require(:board).permit( :title, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  
  end

end
