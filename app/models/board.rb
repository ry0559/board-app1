class Board < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 40, message: '40文字以内で入力してください' }
  validates :text, presence: true, length: { maximum: 1000, message: '1000文字以内で入力してください'}
  # validates :content, presence: true, unless: :image?
  validates :image, presence: true
  mount_uploader :image, ImageUploader
end

