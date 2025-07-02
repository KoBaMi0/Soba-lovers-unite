CarrierWave.configure do |config|
  config.storage    = :fog

  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    region:                ENV.fetch('AWS_REGION'),
    aws_access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
  }

  config.fog_directory  = ENV.fetch('AWS_S3_BUCKET_NAME') 
  config.fog_public     = false 

  config.cache_storage = :file
end
