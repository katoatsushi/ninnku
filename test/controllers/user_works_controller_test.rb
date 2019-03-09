require 'test_helper'

class UserWorksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_works_new_url
    assert_response :success
  end

  test "should get create" do
    get user_works_create_url
    assert_response :success
  end

  test "should get edit" do
    get user_works_edit_url
    assert_response :success
  end

  test "should get delete" do
    get user_works_delete_url
    assert_response :success
  end

  test "should get index" do
    get user_works_index_url
    assert_response :success
  end

  test "should get show" do
    get user_works_show_url
    assert_response :success
  end

end
