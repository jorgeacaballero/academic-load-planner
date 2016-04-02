require 'test_helper'

class ScheduleEventsControllerTest < ActionController::TestCase
  setup do
    @schedule_event = schedule_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:schedule_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create schedule_event" do
    assert_difference('ScheduleEvent.count') do
      post :create, schedule_event: { course_id: @schedule_event.course_id, end_rime: @schedule_event.end_rime, start_time: @schedule_event.start_time, teacher_id: @schedule_event.teacher_id }
    end

    assert_redirected_to schedule_event_path(assigns(:schedule_event))
  end

  test "should show schedule_event" do
    get :show, id: @schedule_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @schedule_event
    assert_response :success
  end

  test "should update schedule_event" do
    patch :update, id: @schedule_event, schedule_event: { course_id: @schedule_event.course_id, end_rime: @schedule_event.end_rime, start_time: @schedule_event.start_time, teacher_id: @schedule_event.teacher_id }
    assert_redirected_to schedule_event_path(assigns(:schedule_event))
  end

  test "should destroy schedule_event" do
    assert_difference('ScheduleEvent.count', -1) do
      delete :destroy, id: @schedule_event
    end

    assert_redirected_to schedule_events_path
  end
end
