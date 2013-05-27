# -*- encoding : utf-8 -*-
class PhotoUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay
  # ::CarrierWave::Workers::ProcessAsset.instance_variable_set('@queue', "#{Rails.env}_process_asset")
  # ::CarrierWave::Workers::StoreAsset.instance_variable_set('@queue', "#{Rails.env}_store_asset")

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  # include Sprockets::Helpers::RailsHelper
  # include Sprockets::Helpers::IsolatedHelper

  # include CarrierWave::MimeTypes
  # process :set_content_type
  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
  
  
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   event = model.event
  #   "#{event.slug}_photo.jpg" if original_filename
  # end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/photos/#{model.id}"
  end

  process :auto_orient
  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end

  process :resize_to_fit => [1920, 1080]

  version :hd do
    process resize_to_fit: [1280, 720]
  end

  version :svga do
    process resize_to_fit: [800, 600]
  end

  version :medium_rect do
    process resize_to_fill: [200, 150]
  end
  
  version :small_rect do
    process resize_to_fill: [140, 105]
  end
  
  version :thumb do
    process resize_to_fill: [75, 75]
  end
  
end
