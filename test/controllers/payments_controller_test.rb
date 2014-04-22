require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post :create, payment: { amount: @payment.amount, bicycle_member: @payment.bicycle_member, buddhist_id: @payment.buddhist_id, comment: @payment.comment, currency: @payment.currency, gym_member: @payment.gym_member, library_member: @payment.library_member, month: @payment.month, parking_car: @payment.parking_car, parking_motorbike: @payment.parking_motorbike, payment_method: @payment.payment_method, payment_type: @payment.payment_type }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should show payment" do
    get :show, id: @payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment
    assert_response :success
  end

  test "should update payment" do
    patch :update, id: @payment, payment: { amount: @payment.amount, bicycle_member: @payment.bicycle_member, buddhist_id: @payment.buddhist_id, comment: @payment.comment, currency: @payment.currency, gym_member: @payment.gym_member, library_member: @payment.library_member, month: @payment.month, parking_car: @payment.parking_car, parking_motorbike: @payment.parking_motorbike, payment_method: @payment.payment_method, payment_type: @payment.payment_type }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete :destroy, id: @payment
    end

    assert_redirected_to payments_path
  end
end
