# == Schema Information
#
# Table name: labels
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  avatar       :string(255)
#  flag_interne :boolean(1)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Label < ActiveRecord::Base
  has_many :syllabuses
  mount_uploader :avatar, ImageUploader
end
