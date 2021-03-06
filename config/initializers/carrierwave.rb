CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'], # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'] # required
  }
  config.fog_directory  = 'xtunes-alex'                     # required
 # config.fog_host       = 'https://s3.amazonaws.com'            # optional, defaults to nil
 config.fog_public     = false                                   # optional, defaults to true
end