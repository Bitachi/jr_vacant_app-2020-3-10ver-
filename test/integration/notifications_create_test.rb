require 'test_helper'

class NotificationsCreateTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "valid register information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get "/notifications"
    assert_difference "Notification.count", 1 do
      post "/notifications", params: { notification: { token: "SampleToken",
                                          dep_stn: "東京",
                                          arr_stn: "岡山",
                                          hour: "22",
                                          minute: "00",
                                          train: "在来線列車",
                                          month: "03",
                                          day: "22"}}
    end
    follow_redirect!
    assert_template root_path
    assert_not flash.nil? #フラッシュのテスト
    assert_not Notification.last.salt.nil? #saltが保存されているかテスト
  end
end
