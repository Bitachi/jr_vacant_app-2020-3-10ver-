module Encryptor
  def encrypt(plaintext)
    key_len = ActiveSupport::MessageEncryptor.key_len
    secret = Rails.application.key_generator.generate_key('salt', key_len)
    crypt = ActiveSupport::MessageEncryptor.new(secret)
    return crypt.encrypt_and_sign(plaintext)
  end

  def decrypt(ciphertext)
    key_len = ActiveSupport::MessageEncryptor.key_len
    secret = Rails.application.key_generator.generate_key('salt', key_len)
    crypt = ActiveSupport::MessageEncryptor.new(secret)
    return crypt.decrypt_and_verify(ciphertext)
  end
end
