class Photo < ActiveRecord::Base
  attr_accessible :image, :title, :remote_image_url
  mount_uploader :image, ImageUploader
end
