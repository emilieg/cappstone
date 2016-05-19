require 'test_helper'

class CalendarControllerTest < ActionController::TestCase
  test "should get api" do
    get :api
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
