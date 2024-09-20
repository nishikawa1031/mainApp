ActiveRecord::Encryption.configure(
  primary_key: ENV['PRIMARY_KEY'],
  deterministic_key: ENV['DETERMINISTIC_KEY'],
  key_derivation_salt: ENV['KEY_DERIVATION_SALT']
)
