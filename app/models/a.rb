#require "#{Rails.root}/app/models/notification"
#exec 'python3  ../env_py/main.py "02" "21" "22" "00" "在来線列車" "東京" "横浜" "MsKONPkSOov7Y9p2pxt8IOPlWHCsBJ2RXxRFSrUmWg9"'
#@notifications = Notification.all
#@notifications.each do |notification|
#  notification.token  = get_token
#  exec 'python3  ./env_py/main.py  #{notificaiton.month} #{notification.day} #{notification.hour} #{notification.minute} #{notification.train} #{notification.dep_stn} #{notification.arr_stn} #{notification.token}'
  #print notification
#class Tasks::DelTmpUsers
#  def self.execute
#    @notifications = Notification.all
#    print(notifications)
#  end
#end

class Notify < ApplicationRecord
  def notify
    notifications = Notification.all

    notifications.each do |notification|
      notification.token  = notification.get_token
      print notification
      #exec 'python3  ./env_py/main.py "02" "21" "22" "00" "在来線列車" "東京" "横浜" "MsKONPkSOov7Y9p2pxt8IOPlWHCsBJ2RXxRFSrUmWg9"'
      #system('python3  ./env_py/main.py', "#{notificaiton.month}" "#{notification.day}" "#{notification.hour}" "#{notification.minute}" "#{notification.train}" "#{notification.dep_stn}" "#{notification.arr_stn}" "#{notification.token}")
    end
  end
end

Notify.notify
