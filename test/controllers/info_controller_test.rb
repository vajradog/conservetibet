require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get browse" do
    get :browse
    assert_response :success
  end

  test "should get contribute" do
    get :contribute
    assert_response :success
  end

end
