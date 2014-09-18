require 'test_helper'

class BarbecuesControllerTest < ActionController::TestCase
  setup do
    @barbecue = barbecues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barbecues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barbecue" do
    assert_difference('Barbecue.count') do
      post :create, barbecue: { begin_date: @barbecue.begin_date, title: @barbecue.title }
    end

    assert_redirected_to barbecue_path(assigns(:barbecue))
  end

  test "should show barbecue" do
    get :show, id: @barbecue
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barbecue
    assert_response :success
  end

  test "should update barbecue" do
    patch :update, id: @barbecue, barbecue: { begin_date: @barbecue.begin_date, title: @barbecue.title }
    assert_redirected_to barbecue_path(assigns(:barbecue))
  end

  test "should destroy barbecue" do
    assert_difference('Barbecue.count', -1) do
      delete :destroy, id: @barbecue
    end

    assert_redirected_to barbecues_path
  end
end
