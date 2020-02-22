class Notification < ApplicationRecord
  #include Encryptor
  before_save { encrypt_token }


  CIPHER = "aes-256-cbc"
  def encrypt(password)
    secure = Rails.application.secrets.encrypt_secure_key
    crypt = ActiveSupport::MessageEncryptor.new(secure, CIPHER)
    crypt.encrypt_and_sign(password)
  end

  def decrypt(password)
    secure = Rails.application.secrets.encrypt_secure_key
    crypt = ActiveSupport::MessageEncryptor.new(secure, CIPHER)
    crypt.decrypt_and_verify(password)
  end

  def encrypt_token
     self.token = encrypt(self.token)
  end

  def get_token
    return decrypt(self.token)
  end
  def self.notify
    notifications = Notification.all

    notifications.each do |notification|
      notification.token  = notification.get_token
      system("python3  ./env_py/main.py #{notification.month} #{notification.day} #{notification.hour} #{notification.minute} #{notification.train} #{notification.dep_stn} #{notification.arr_stn} #{notification.token}")
    end
  end


end

Notification.notify
