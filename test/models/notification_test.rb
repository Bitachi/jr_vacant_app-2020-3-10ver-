require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @notification = Notification.new(token:"hoge", month:"03", day:"21", dep_stn:"東京", arr_stn:"大垣", train: "在来線列車", hour: "22", minute: "00")
  end

  test "should be valid" do
    assert @notification.valid?
    @notification.save
    assert_not @notification.salt.empty?
  end





end
