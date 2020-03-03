require 'test_helper'

class NotificationsEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @notification = notifications(:michael)
  end

  test "unsuccessful edit(notification)" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get "/notification/#{@notification.id}/edit"
    assert_template "notification/edit"
    patch "/notification/#{@notification.id}/update", params: { notification: {token: "",
                                                        month: "",
                                                        day: "",
                                                        train: "",
                                                        hour: "",
                                                        minute: "",
                                                        dep_stn: "",
                                                        arr_stn: ""}}

    assert_template "notification/#{notification.id}/edit"

  end

  test "successful edit" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get "/notification/#{@notification.id}/edit"
    assert_template "notification/edit"
    token = "NewToken"
    patch "/notification/#{@notification.id}/update", params: { notification: {token: token,
                              month: "03",
                              day: "24",
                              train: "在来線列車",
                              hour: "23",
                              minute: "10",
                              dep_stn: "東京",
                              arr_stn: "大垣"}}
    assert_not flash.empty?
    assert_redirected_to notifications_index_path
    @notification.reload
    assert_equal token, @notification.get_token
  end
end
