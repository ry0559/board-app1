class Board < ApplicationRecord
  belongs_to :user
  validates :title, presence: { message: "タイトルを入力してください"}, length: { maximum: 40, message: '40文字以内で入力してください' }
  validates :text, presence:  { message: "テキストを入力してください"}, length: { maximum: 1000, message: '1000文字以内で入力してください'}
  # validates :content, presence: true, unless: :image?
  validates :image, presence: { message: "写真を選択してください"}
  mount_uploader :image, ImageUploader
end

