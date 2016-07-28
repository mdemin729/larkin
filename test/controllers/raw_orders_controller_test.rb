require 'test_helper'

class RawOrdersControllerTest < ActionController::TestCase
  setup do
    @raw_order = raw_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:raw_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create raw_order" do
    assert_difference('RawOrder.count') do
      post :create, raw_order: { client: @raw_order.client, delivery_date: @raw_order.delivery_date, delivery_shift: @raw_order.delivery_shift, destination_city: @raw_order.destination_city, destination_raw_line_1: @raw_order.destination_raw_line_1, destination_state: @raw_order.destination_state, destination_zip: @raw_order.destination_zip, handling_unit_quantity: @raw_order.handling_unit_quantity, handling_unit_type: @raw_order.handling_unit_type, mode: @raw_order.mode, name: @raw_order.name, origin_city: @raw_order.origin_city, origin_name: @raw_order.origin_name, origin_raw_line_1: @raw_order.origin_raw_line_1, origin_state: @raw_order.origin_state, origin_zip: @raw_order.origin_zip, phone_number: @raw_order.phone_number, purchase_order_number: @raw_order.purchase_order_number, volume: @raw_order.volume }
    end

    assert_redirected_to raw_order_path(assigns(:raw_order))
  end

  test "should show raw_order" do
    get :show, id: @raw_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @raw_order
    assert_response :success
  end

  test "should update raw_order" do
    patch :update, id: @raw_order, raw_order: { client: @raw_order.client, delivery_date: @raw_order.delivery_date, delivery_shift: @raw_order.delivery_shift, destination_city: @raw_order.destination_city, destination_raw_line_1: @raw_order.destination_raw_line_1, destination_state: @raw_order.destination_state, destination_zip: @raw_order.destination_zip, handling_unit_quantity: @raw_order.handling_unit_quantity, handling_unit_type: @raw_order.handling_unit_type, mode: @raw_order.mode, name: @raw_order.name, origin_city: @raw_order.origin_city, origin_name: @raw_order.origin_name, origin_raw_line_1: @raw_order.origin_raw_line_1, origin_state: @raw_order.origin_state, origin_zip: @raw_order.origin_zip, phone_number: @raw_order.phone_number, purchase_order_number: @raw_order.purchase_order_number, volume: @raw_order.volume }
    assert_redirected_to raw_order_path(assigns(:raw_order))
  end

  test "should destroy raw_order" do
    assert_difference('RawOrder.count', -1) do
      delete :destroy, id: @raw_order
    end

    assert_redirected_to raw_orders_path
  end
end
