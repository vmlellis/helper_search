require 'test_helper'

class SearchBoxesControllerTest < ActionController::TestCase
  setup do
    @search_box = search_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_box" do
    assert_difference('SearchBox.count') do
      post :create, search_box: { ip: @search_box.ip, text: @search_box.text }
    end

    assert_redirected_to search_box_path(assigns(:search_box))
  end

  test "should show search_box" do
    get :show, id: @search_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_box
    assert_response :success
  end

  test "should update search_box" do
    patch :update, id: @search_box, search_box: { ip: @search_box.ip, text: @search_box.text }
    assert_redirected_to search_box_path(assigns(:search_box))
  end

  test "should destroy search_box" do
    assert_difference('SearchBox.count', -1) do
      delete :destroy, id: @search_box
    end

    assert_redirected_to search_boxes_path
  end
end
