require "application_system_test_case"

class Admin::CatagoriesTest < ApplicationSystemTestCase
  setup do
    @admin_catagory = admin_catagories(:one)
  end

  test "visiting the index" do
    visit admin_catagories_url
    assert_selector "h1", text: "Catagories"
  end

  test "should create catagory" do
    visit admin_catagories_url
    click_on "New catagory"

    fill_in "Description", with: @admin_catagory.description
    fill_in "Name", with: @admin_catagory.name
    click_on "Create Catagory"

    assert_text "Catagory was successfully created"
    click_on "Back"
  end

  test "should update Catagory" do
    visit admin_catagory_url(@admin_catagory)
    click_on "Edit this catagory", match: :first

    fill_in "Description", with: @admin_catagory.description
    fill_in "Name", with: @admin_catagory.name
    click_on "Update Catagory"

    assert_text "Catagory was successfully updated"
    click_on "Back"
  end

  test "should destroy Catagory" do
    visit admin_catagory_url(@admin_catagory)
    click_on "Destroy this catagory", match: :first

    assert_text "Catagory was successfully destroyed"
  end
end
