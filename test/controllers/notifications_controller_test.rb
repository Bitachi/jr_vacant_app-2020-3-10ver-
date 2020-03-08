require 'test_helper'

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other_user = users(:archer)
    post "/notifications", params: { notification: { token: "SampleToken",
                                        dep_stn: "東京",
                                        arr_stn: "岡山",
                                        hour: "22",
                                        minute: "00",
                                        train: "在来線列車",
                                        month: "03",
                                        day: "30"}}
    @notification = Notification.find_by(email: @user.email)
  end

  test "should get new" do
    get notifications_path
    assert_response :success
  end
=begin
  test "should redirect edit when not logged in" do
    get "/notifications/#{@notification.id}/edit"
    assert_not flash.empty?
    assert_redirected_to "/login"
  end

  test "should redirect update when not logged in" do
    get "/notifications/#{@notification.id}/update"
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect edit when logged in as other user" do
    log_in_as(@other_user)
    get "/notifications/#{@notification.id}/edit"
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should redirect update when logged in as other user" do
    log_in_as(@other_user)
    get "/notifications/#{@notification.id}/update"
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "should redirect destroy when not logged in" do
    get "/notifications/#{@notification.id}/destroy"
    assert_redirected_to login_path
  end

  test "should redirect destroy when login as other user" do
    log_in_as(@other_user)
    get "/notifications/#{@notification.id}/destroy"
    assert_redirected_to notifications_index_path
  end
=end
end
