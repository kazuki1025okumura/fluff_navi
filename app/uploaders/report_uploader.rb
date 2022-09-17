class ReportUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    'no_image.jpg'
  end

  def extension_allowlist
    %w[jpg jpeg png]
  end
end
