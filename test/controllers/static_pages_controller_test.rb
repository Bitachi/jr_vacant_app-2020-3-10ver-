require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "JR空席通知アプリ"
  end

  test "should get root" do
    get root_path
    assert_response :success
  end


  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "このアプリについて | #{@base_title}"
  end

end
