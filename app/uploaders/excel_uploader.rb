# encoding: utf-8

class ExcelUploader < CarrierWave::Uploader::Base
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Rails.root}/public/uploads/spreadsheets"
  end

  #def cache_dir
  #  "#{Rails.root}/public/uploads/spreadsheets"
  #end

  def extension_white_list
      %w(xls)
    end

end
