class Board < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: { message: "タイトルを入力してください"}, length: { maximum: 40, message: '40文字以内で入力してください' }
  validates :text, presence:  { message: "テキストを入力してください"}, length: { maximum: 500, message: '500文字以内で入力してください'}
  # validates :content, presence: true, unless: :image?
  validates :image, 
  mount_uploader :image, ImageUploader
end

