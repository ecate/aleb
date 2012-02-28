class LabelSyllabus < ActiveRecord::Base
  belongs_to :syllabus
  belongs_to :label
end
