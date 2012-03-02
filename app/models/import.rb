class Import < ActiveRecord::Base
  mount_uploader :spread, ExcelUploader

end
