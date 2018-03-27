require 'test_helper'

class PromisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get promises_index_url
    assert_response :success
  end

  test "should get show" do
    get promises_show_url
    assert_response :success
  end

  test "should get new" do
    get promises_new_url
    assert_response :success
  end

  test "should get create" do
    get promises_create_url
    assert_response :success
  end

  test "should get edit" do
    get promises_edit_url
    assert_response :success
  end

  test "should get update" do
    get promises_update_url
    assert_response :success
  end

  test "should get destroy" do
    get promises_destroy_url
    assert_response :success
  end

end
