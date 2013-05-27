# -*- encoding : utf-8 -*-
if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://localhost:6379', :namespace => 'sidekiq' }
    config.server_middleware do |chain|
      chain.add Kiqstand::Middleware
    end
  end

  Sidekiq.configure_client do |config|
    config.redis = { :url => 'redis://localhost:6379', :namespace => 'sidekiq' }
  end
end
