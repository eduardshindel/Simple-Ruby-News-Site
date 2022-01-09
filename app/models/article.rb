class Article < ApplicationRecord
        validates_presence_of :title, :preview, :category, :body
        mount_uploader :img, ImgUploader
end
