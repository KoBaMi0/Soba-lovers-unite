unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      region:                ENV.fetch('AWS_REGION'),
      aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }

    config.fog_directory  = ENV.fetch('AWS_S3_BUCKET_NAME')
    config.cache_storage = :fog
  end
end
