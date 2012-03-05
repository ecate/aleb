# == Schema Information
#
# Table name: lessons
#
#  id             :integer(4)      not null, primary key
#  syllabus_id    :integer(4)
#  horaire        :datetime
#  flag_recurrent :boolean(1)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Lesson < ActiveRecord::Base
  belongs_to :syllabus


end
