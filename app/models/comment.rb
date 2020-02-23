class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :comment, presence:  { message: "コメントを入力してください"}, length: { maximum: 300, message: '300文字以内で入力してください'}
end
