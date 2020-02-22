class Notification < ApplicationRecord
  #include Encryptor
    def self.notify
    notifications = Notification.all

    notifications.each do |notification|
    #  notification.token  = notification.get_token
      system("python3  ./env_py/main.py #{notification.month} #{notification.day} #{notification.hour} #{notification.minute} #{notification.train} #{notification.dep_stn} #{notification.arr_stn} #{notification.token}")
    end
  end


end

Notification.notify
