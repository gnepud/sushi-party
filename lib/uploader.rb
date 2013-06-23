class Uploader < CarrierWave::Uploader::Base

  ##
  # Image manipulator library:
  #
  include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  # include CarrierWave::MiniMagick

  ##
  # Storage type
  #
  #storage :file
  configure do |config|
    config.fog_credentials = {
      :provider              => 'Google',
      :google_storage_access_key_id     => ENV['GOOGLE_STORAGE_KEY'],
      :google_storage_secret_access_key => ENV['GOOGLE_STORAGE_SECRET']
    }
    if PADRINO_ENV = 'development'
      config.fog_directory = 'sushi-party-dev'
    else
      config.fog_directory = 'sushi-party'
    end
  end
  storage :fog


  ## Manually set root
  def root; File.join(Padrino.root,"public/"); end

  ##
  # Directory where uploaded files will be stored (default is /public/uploads)
  #
  def store_dir
    "images/#{model.class.to_s.underscore}/#{model.id}"
  end

  ##
  # Directory where uploaded temp files will be stored (default is [root]/tmp)
  #
  def cache_dir
    Padrino.root("tmp")
  end

  ##
  # Default URL as a default if there hasn't been a file uploaded
  #
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  ##
  # Process files as they are uploaded.
  #
  process :resize_to_limit => [800, 600]

  version :thumb do
    process :resize_to_limit => [400, 300]
  end
  ##
  # Create different versions of your uploaded files
  #
  #version :header do
    #process :resize_to_fill => [940, 250]
    #version :thumb do
      #process :resize_to_fill => [230, 85]
    #end
  #end
  ##
  # White list of extensions which are allowed to be uploaded:
  #
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  ##
  # Override the filename of the uploaded files
  #
  # def filename
  #   "something.jpg" if original_filename
  # end
end
