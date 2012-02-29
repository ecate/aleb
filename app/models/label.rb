# == Schema Information
#
# Table name: labels
#
#  id         :integer(4)      not null, primary key
#  nom        :string(255)
#  avatar     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Label < ActiveRecord::Base
  has_many :syllabuses
end
