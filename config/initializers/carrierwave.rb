# -*- encoding : utf-8 -*-
# Mongoid::Document::ClassMethods.send(:include, ::CarrierWave::Backgrounder::ORM::Base)

module CarrierWave
  module RMagick

    def quality(percentage)
      manipulate! do |img|
        img.write(current_path){ self.quality = percentage } unless img.quality == percentage
        img = yield(img) if block_given?
        img
      end
    end

  end
end

CarrierWave.configure do |config|
  config.storage = :file
  config.asset_host = "https://www.liveslide.tv" unless Rails.env.development?

  # if Rails.env.development?
  #   #     config.fog_credentials = {
  #   #       provider:             'Rackspace',
  #   #       rackspace_username:   'gambo',
  #   #       rackspace_api_key:    '1a031ef44ef2d2305355d00320c62210',
  #   #       rackspace_auth_url:  'lon.auth.api.rackspacecloud.com'
  #   #     }
  #   #     config.fog_directory =  'liveslide-development'
  #   # config.fog_host =       'http://d3995547248f5cb0b3bb-d592beb807d66e29c9e3caf39bbfb207.r99.cf3.rackcdn.com'
  #   # config.storage = :fog   
  #   
  #   config.storage = :file
  # else
  #   config.fog_credentials = {
  #     provider:             'Rackspace',
  #     rackspace_username:   'gambo',
  #     rackspace_api_key:    '1a031ef44ef2d2305355d00320c62210',
  #     rackspace_auth_url:   'lon.auth.api.rackspacecloud.com'
  #   }
  #   config.fog_directory =   'liveslide'
  #   config.asset_host =        'https://f5e2c9d5fea983987b80-412489124d858f9d3e6289d15c849d40.ssl.cf3.rackcdn.com'
  #   config.storage = :fog    
  # end
end
