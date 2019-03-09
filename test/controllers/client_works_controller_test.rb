require 'test_helper'

class ClientWorksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get client_works_new_url
    assert_response :success
  end

  test "should get create" do
    get client_works_create_url
    assert_response :success
  end

  test "should get edit" do
    get client_works_edit_url
    assert_response :success
  end

  test "should get update" do
    get client_works_update_url
    assert_response :success
  end

  test "should get delete" do
    get client_works_delete_url
    assert_response :success
  end

  test "should get show" do
    get client_works_show_url
    assert_response :success
  end

  test "should get index" do
    get client_works_index_url
    assert_response :success
  end

end
