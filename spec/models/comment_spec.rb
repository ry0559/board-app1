require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#create' do
    context '保存できる場合' do
      it 'commentが存在すれば保存できる' do
        expect(build(:comment)).to be_valid
      end
    end

    context '保存できない場合' do
      it 'commentが無いと保存できない' do
        comment = build(:comment, comment: nil)
        comment.valid?
        expect(comment.errors[:comment]).to include("コメントを入力してください")
      end
      it 'commentが300文字以上は保存できない' do
        comment = build(:comment, comment: "アイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこアイウエオかきくけこあ")
        comment.valid?
        expect(comment.errors[:comment]).to include("300文字以内で入力してください")
      end
    end
  end
end
