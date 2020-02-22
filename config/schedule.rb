require File.expand_path(File.dirname(__FILE__) + "/environment")

# 実行環境を指定する
set :environment, Rails.env.to_sym
# 実行logの出力先
set :output, "#{Rails.root.to_s}/log/cron.log"
"""
every 10.minute do
  runner ../app/models/notification.rb
end
"""
