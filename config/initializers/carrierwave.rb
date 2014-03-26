CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider  => 'AWS',  # required
    :aws_access_key_id  => 'AKIAJAZSLXTROIMQGOFQ',  # required
    :aws_secret_access_key  => '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',  # required
    :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'stranded-travel-march-2014'  # required
  config.fog_public  = true  # optional, defaults to true
end