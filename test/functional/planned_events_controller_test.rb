require 'test_helper'

class PlannedEventsControllerTest < ActionController::TestCase
  setup do
    @planned_event = planned_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planned_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planned_event" do
    assert_difference('PlannedEvent.count') do
      post :create, planned_event: @planned_event.attributes
    end

    assert_redirected_to planned_event_path(assigns(:planned_event))
  end

  test "should show planned_event" do
    get :show, id: @planned_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planned_event.to_param
    assert_response :success
  end

  test "should update planned_event" do
    put :update, id: @planned_event.to_param, planned_event: @planned_event.attributes
    assert_redirected_to planned_event_path(assigns(:planned_event))
  end

  test "should destroy planned_event" do
    assert_difference('PlannedEvent.count', -1) do
      delete :destroy, id: @planned_event.to_param
    end

    assert_redirected_to planned_events_path
  end
end
