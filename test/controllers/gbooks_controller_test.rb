require 'test_helper'

class GbooksControllerTest < ActionController::TestCase
  setup do
    @gbook = gbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gbook" do
    assert_difference('Gbook.count') do
      post :create, gbook: {  }
    end

    assert_redirected_to gbook_path(assigns(:gbook))
  end

  test "should show gbook" do
    get :show, id: @gbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gbook
    assert_response :success
  end

  test "should update gbook" do
    patch :update, id: @gbook, gbook: {  }
    assert_redirected_to gbook_path(assigns(:gbook))
  end

  test "should destroy gbook" do
    assert_difference('Gbook.count', -1) do
      delete :destroy, id: @gbook
    end

    assert_redirected_to gbooks_path
  end
end
