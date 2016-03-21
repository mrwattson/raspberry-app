require 'test_helper'

class MonitorControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end


  test "should get footprint" do
    get :footprint
    assert_response :success
  end
end
