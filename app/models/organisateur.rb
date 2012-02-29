class Organisateur < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
end
