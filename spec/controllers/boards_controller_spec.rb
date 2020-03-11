require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:user) { create(:user) }
  let(:board) { create(:board) } 


  
  describe "GET #new" do
    it "newテンプレートをレンダリング" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "GET #edit" do
    context "log in" do
      # let(:params) { { user_id: current_user.id } }
      before do
        login user
      end
      
      it "要求されたboardを@boardに割り当てる" do
        board = create(:board)
        get :edit ,params: { id: board }
        expect(assigns(:board)).to eq board 
      end
      it "editテンプレートをレンダリング" do
        # board = create(:board)
        get :edit, params: { id: board }
        expect(response).to render_template :edit 
      end
    end
    context "not login" do
      describe "GET #index" do
        it "created_atで順序付けられたboardの配列を作成する" do
          boards = create_list(:board, 3)
          get :index
          expect(assigns(:boards)).to match(boards) 
        end
        it "indexテンプレートをレンダリング" do
          get :index
          expect(response).to render_template :index
        end
      end
    end
  end
end
