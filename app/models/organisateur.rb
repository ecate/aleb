# == Schema Information
#
# Table name: organisateurs
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  avatar      :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Organisateur < ActiveRecord::Base
  mount_uploader :avatar, ImageUploader
  has_many :syllabuses, :dependent => :destroy

  validates :name, :presence => true

end
