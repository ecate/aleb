# == Schema Information
#
# Table name: imports
#
#  id         :integer(4)      not null, primary key
#  spread     :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Import < ActiveRecord::Base
  mount_uploader :spread, ExcelUploader

end
