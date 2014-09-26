require 'test_helper'

class BarbecueIngredientsControllerTest < ActionController::TestCase
  setup do
    @barbecue_ingredient = barbecue_ingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barbecue_ingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barbecue_ingredient" do
    assert_difference('BarbecueIngredient.count') do
      post :create, barbecue_ingredient: { quantity: @barbecue_ingredient.quantity, barbecue_id: @barbecue_ingredient.barbecue_id,  ingredient_id: @barbecue_ingredient.ingredient_id,  }
    end

    assert_redirected_to barbecue_ingredient_path(assigns(:barbecue_ingredient))
  end

  test "should show barbecue_ingredient" do
    get :show, id: @barbecue_ingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barbecue_ingredient
    assert_response :success
  end

  test "should update barbecue_ingredient" do
    patch :update, id: @barbecue_ingredient, barbecue_ingredient: {  }
    assert_redirected_to barbecue_ingredient_path(assigns(:barbecue_ingredient))
  end

  test "should destroy barbecue_ingredient" do
    assert_difference('BarbecueIngredient.count', -1) do
      delete :destroy, id: @barbecue_ingredient
    end

    assert_redirected_to barbecue_ingredients_path
  end
end
