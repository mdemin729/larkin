require 'test_helper'

class DailySchedulesControllerTest < ActionController::TestCase
  setup do
    @daily_schedule = daily_schedules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_schedules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_schedule" do
    assert_difference('DailySchedule.count') do
      post :create, daily_schedule: { delivery_date: @daily_schedule.delivery_date }
    end

    assert_redirected_to daily_schedule_path(assigns(:daily_schedule))
  end

  test "should show daily_schedule" do
    get :show, id: @daily_schedule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @daily_schedule
    assert_response :success
  end

  test "should update daily_schedule" do
    patch :update, id: @daily_schedule, daily_schedule: { delivery_date: @daily_schedule.delivery_date }
    assert_redirected_to daily_schedule_path(assigns(:daily_schedule))
  end

  test "should destroy daily_schedule" do
    assert_difference('DailySchedule.count', -1) do
      delete :destroy, id: @daily_schedule
    end

    assert_redirected_to daily_schedules_path
  end
end
