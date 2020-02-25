require 'rails_helper'


RSpec.describe Board, type: :model do
  describe '#create' do
    context "保存できる場合" do
      it "titleとtextが存在すれば保存できる" do
        expect(build(:board)).to be_valid
      end
    end
    
    context "保存できない場合" do
      it "titleが無いと保存できない" do
        board = build(:board, title: nil)
        board.valid?
        expect(board.errors[:title]).to include("タイトルを入力してください")
      end
      it "titleが40文字以上は保存できない" do
        board = build(:board, title: "アイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこ")
        board.valid?
        expect(board.errors[:title]).to include("40文字以内で入力してください")
      end
      it "textが無いと保存できない" do
        board = build(:board, text: nil)
        board.valid?
        expect(board.errors[:text]).to include("テキストを入力してください")
      end
      it "textが500文字以上は保存できない" do
        board = build(:board, text: "アイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこか")
        board.valid?
        expect(board.errors[:text]).to include("500文字以内で入力してください")
      end
    end
  end  
end


