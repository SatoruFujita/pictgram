class Topic < ApplicationRecord
  validates :user_id, presence:true
  validates :description, presence:true
  validates :image, presence:true

  mount_uploader :image, ImageUploader
  validate :image_valid?
  def image_valid?
    if image.file.content_type != "image/jpeg" && image.file.content_type != "image/png"
      errors.add(:uploader, "不正なファイルが添付されています。")
    end
  end

  belongs_to :user
  has_many :favorites
  has_many :comments
  has_many :favorite_users, through: :favorites, source: 'user'



end
