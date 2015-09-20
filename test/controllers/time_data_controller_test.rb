require 'test_helper'

class TimeDataControllerTest < ActionController::TestCase
  setup do
    @time_datum = time_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_datum" do
    assert_difference('TimeDatum.count') do
      post :create, time_datum: { enum: @time_datum.enum }
    end

    assert_redirected_to time_datum_path(assigns(:time_datum))
  end

  test "should show time_datum" do
    get :show, id: @time_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_datum
    assert_response :success
  end

  test "should update time_datum" do
    patch :update, id: @time_datum, time_datum: { enum: @time_datum.enum }
    assert_redirected_to time_datum_path(assigns(:time_datum))
  end

  test "should destroy time_datum" do
    assert_difference('TimeDatum.count', -1) do
      delete :destroy, id: @time_datum
    end

    assert_redirected_to time_data_path
  end
end
