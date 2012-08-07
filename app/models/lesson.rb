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
  validates :syllabus_id, :horaire, :presence => true, :allow_blank => false

  ransacker :horaire_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(lessons.horaire)")
  end

end
