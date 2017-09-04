class CoverUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [250, 333]
  process :convert => 'png'

  version :small do
    process resize_to_fill: [125, 200]
    process :convert => 'png'
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    "cover_#{secure_token(10)}.#{file.extension}" if original_filename
  end

  protected
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token_#{Time.now.to_i}"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end
