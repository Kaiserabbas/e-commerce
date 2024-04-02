require "test_helper"

class Admin::CatagoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_catagory = admin_catagories(:one)
  end

  test "should get index" do
    get admin_catagories_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_catagory_url
    assert_response :success
  end

  test "should create admin_catagory" do
    assert_difference("Admin::Catagory.count") do
      post admin_catagories_url,
           params: { admin_catagory: { description: @admin_catagory.description, name: @admin_catagory.name } }
    end

    assert_redirected_to admin_catagory_url(Admin::Catagory.last)
  end

  test "should show admin_catagory" do
    get admin_catagory_url(@admin_catagory)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_catagory_url(@admin_catagory)
    assert_response :success
  end

  test "should update admin_catagory" do
    patch admin_catagory_url(@admin_catagory),
          params: { admin_catagory: { description: @admin_catagory.description, name: @admin_catagory.name } }
    assert_redirected_to admin_catagory_url(@admin_catagory)
  end

  test "should destroy admin_catagory" do
    assert_difference("Admin::Catagory.count", -1) do
      delete admin_catagory_url(@admin_catagory)
    end

    assert_redirected_to admin_catagories_url
  end
end
