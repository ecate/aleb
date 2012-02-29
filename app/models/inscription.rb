# == Schema Information
#
# Table name: inscriptions
#
#  id         :integer(4)      not null, primary key
#  lesson_id  :integer(4)
#  user_id    :integer(4)
#  date       :datetime
#  flag_paye  :boolean(1)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Inscription < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :user
end
