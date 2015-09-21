CarrierWave.configure do |config|
    # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJUPV6UY2K2UBP6JA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'clothdb'                          # required

end