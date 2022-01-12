class Article < ApplicationRecord
  validates :title, :preview, :category, :body, presence: true
  mount_uploader :img, ImgUploader
end
