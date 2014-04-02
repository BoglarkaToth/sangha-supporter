require 'test_helper'

class BuddhistsControllerTest < ActionController::TestCase
  setup do
    @buddhist = buddhists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buddhists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buddhist" do
    assert_difference('Buddhist.count') do
      post :create, buddhist: { address: @buddhist.address, buzzer_id: @buddhist.buzzer_id, email: @buddhist.email, local_center: @buddhist.local_center, name: @buddhist.name, program_sms: @buddhist.program_sms, status: @buddhist.status, telephone_number: @buddhist.telephone_number }
    end

    assert_redirected_to buddhist_path(assigns(:buddhist))
  end

  test "should show buddhist" do
    get :show, id: @buddhist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buddhist
    assert_response :success
  end

  test "should update buddhist" do
    patch :update, id: @buddhist, buddhist: { address: @buddhist.address, buzzer_id: @buddhist.buzzer_id, email: @buddhist.email, local_center: @buddhist.local_center, name: @buddhist.name, program_sms: @buddhist.program_sms, status: @buddhist.status, telephone_number: @buddhist.telephone_number }
    assert_redirected_to buddhist_path(assigns(:buddhist))
  end

  test "should destroy buddhist" do
    assert_difference('Buddhist.count', -1) do
      delete :destroy, id: @buddhist
    end

    assert_redirected_to buddhists_path
  end
end
