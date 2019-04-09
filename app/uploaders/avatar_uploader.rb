class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  storage :file
# storage :fog

  process resize_to_fit: [100, 100]
  
  # def resize_to_fill(width, height)
  #   process :resize_to_fill => [width, height]
  # end
  version :thumb do
    process resize_to_fill: [50, 50]
  end
  
  # version :detail do
  #     process :quality => 90
  #   end
  #   version :main, :if => :image?  do
  #       process optimize: [{ quality: 90 }]
  #       process :resize_to_fit => [240, 180] ,:if => :horizontal?
  #       process :resize_to_fit => [240, 320]  ,:if => :vertical?
  #   end

  # def image?(new_file)
  #     self.file.content_type.include? 'image'
  # end

  # def horizontal?(new_file)
  #   image = MiniMagick::Image.open(self.file.file)
  #   true if image[:height] < image[:width]
  # end

  # def vertical?(new_file)
  #   image = MiniMagick::Image.open(self.file.file)
  #   true if image[:height] > image[:width]
  # end
# Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [10, 10]
  # 
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end
  
  # version :small do
  #   process :resize_to_fit => [150, 150]
  #   process :quality => 100
  # end
  
  # version :medium do
  #   process :resize_to_fit => [200, 200]
  #   process :quality => 100
  # end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
