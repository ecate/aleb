# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Sprockets::Helpers::RailsHelper
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "#{Rails.root}/public/uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
     "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

  # Process files as they are uploaded:
  process :resize_and_pad => [200, 120]
  process :convert => :png

  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
     process :resize_and_pad => [50, 30]
  end


  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
     %w(jpg jpeg png gif)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def filename
    if original_filename
      if model && model.read_attribute(:avatar).present? #or whatever you call your column
        model.read_attribute(:avatar)
      else
      # create new filename however you're doing it
        @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
        "#{@name}.#{file.extension}"
      end
    end
  end
    # store! nil's the cache_id after it finishes so we need to remember it for deletion
    def remember_cache_id(new_file)
      @cache_id_was = cache_id
    end

    def delete_tmp_dir(new_file)
      # make sure we don't delete other things accidentally by checking the name pattern
      if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
        FileUtils.rm_rf(File.join(cache_dir, @cache_id_was))
      end
    end


end
