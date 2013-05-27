# -*- encoding : utf-8 -*-
class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :photo, PhotoUploader

  field :photo_tmp, type: String
  store_in_background :photo
end
