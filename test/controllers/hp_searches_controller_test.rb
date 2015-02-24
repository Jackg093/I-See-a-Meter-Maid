require 'test_helper'

class HpSearchesControllerTest < ActionController::TestCase
  setup do
    @hp_search = hp_searches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hp_searches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hp_search" do
    assert_difference('HpSearch.count') do
      post :create, hp_search: { name: @hp_search.name, zipcode: @hp_search.zipcode }
    end

    assert_redirected_to hp_search_path(assigns(:hp_search))
  end

  test "should show hp_search" do
    get :show, id: @hp_search
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hp_search
    assert_response :success
  end

  test "should update hp_search" do
    patch :update, id: @hp_search, hp_search: { name: @hp_search.name, zipcode: @hp_search.zipcode }
    assert_redirected_to hp_search_path(assigns(:hp_search))
  end

  test "should destroy hp_search" do
    assert_difference('HpSearch.count', -1) do
      delete :destroy, id: @hp_search
    end

    assert_redirected_to hp_searches_path
  end
end
