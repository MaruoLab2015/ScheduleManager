require 'test_helper'

class ExpPlansControllerTest < ActionController::TestCase
  setup do
    @exp_plan = exp_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exp_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exp_plan" do
    assert_difference('ExpPlan.count') do
      post :create, exp_plan: { planDay: @exp_plan.planDay, userName: @exp_plan.userName }
    end

    assert_redirected_to exp_plan_path(assigns(:exp_plan))
  end

  test "should show exp_plan" do
    get :show, id: @exp_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exp_plan
    assert_response :success
  end

  test "should update exp_plan" do
    put :update, id: @exp_plan, exp_plan: { planDay: @exp_plan.planDay, userName: @exp_plan.userName }
    assert_redirected_to exp_plan_path(assigns(:exp_plan))
  end

  test "should destroy exp_plan" do
    assert_difference('ExpPlan.count', -1) do
      delete :destroy, id: @exp_plan
    end

    assert_redirected_to exp_plans_path
  end
end
