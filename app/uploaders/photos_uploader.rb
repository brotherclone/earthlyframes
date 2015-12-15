# encoding: utf-8

class PhotosUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
