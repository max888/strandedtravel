CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => ENV['AWS_ACCESS_KEY_ID_ST'],  # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY_ST'],  # required
    :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['WDI_S3_BUCKET_ST']  # required
  config.fog_public  = true  # optional, defaults to true
end