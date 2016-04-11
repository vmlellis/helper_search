require 'test_helper'

class SearchAnalyticsControllerTest < ActionController::TestCase
  setup do
    @search_analytic = search_analytics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_analytics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_analytic" do
    assert_difference('SearchAnalytic.count') do
      post :create, search_analytic: { count: @search_analytic.count, text: @search_analytic.text }
    end

    assert_redirected_to search_analytic_path(assigns(:search_analytic))
  end

  test "should show search_analytic" do
    get :show, id: @search_analytic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @search_analytic
    assert_response :success
  end

  test "should update search_analytic" do
    patch :update, id: @search_analytic, search_analytic: { count: @search_analytic.count, text: @search_analytic.text }
    assert_redirected_to search_analytic_path(assigns(:search_analytic))
  end

  test "should destroy search_analytic" do
    assert_difference('SearchAnalytic.count', -1) do
      delete :destroy, id: @search_analytic
    end

    assert_redirected_to search_analytics_path
  end
end
