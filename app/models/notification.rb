class Notification < ApplicationRecord
  #before_save { self.email = email.downcase }
  before_save {
    #lineトークンの暗号化
    key_len = ActiveSupport::MessageEncryptor.key_len
    secret = Rails.application.key_generator.generate_key('salt', key_len)
    crypt = ActiveSupport::MessageEncryptor.new(secret)
    self.token = crypt.encrypt_and_sign(token)
    #crypt.decrypt_and_verify(encrypted)
    # => 'Qiitaきーたキータ'
   }


end
