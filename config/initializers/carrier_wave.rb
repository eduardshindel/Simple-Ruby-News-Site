require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.permissions = 0o666
  config.directory_permissions = 0o777
  config.storage = :file
end
