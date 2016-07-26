require 'test_helper'

class ClientControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get create" do
    get :new
    assert_response :success
  end

  test "should get update" do
    get :edit
    assert_response :success
  end

end
