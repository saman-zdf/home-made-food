require "application_system_test_case"

class FoodItemsTest < ApplicationSystemTestCase
  setup do
    @food_item = food_items(:one)
  end

  test "visiting the index" do
    visit food_items_url
    assert_selector "h1", text: "Food Items"
  end

  test "creating a Food item" do
    visit food_items_url
    click_on "New Food Item"

    check "Availability" if @food_item.availability
    fill_in "Buyer", with: @food_item.buyer_id
    fill_in "Description", with: @food_item.description
    fill_in "Food type", with: @food_item.food_type
    fill_in "Name", with: @food_item.name
    fill_in "Price", with: @food_item.price
    fill_in "Profile", with: @food_item.profile_id
    fill_in "Seller", with: @food_item.seller_id
    click_on "Create Food item"

    assert_text "Food item was successfully created"
    click_on "Back"
  end

  test "updating a Food item" do
    visit food_items_url
    click_on "Edit", match: :first

    check "Availability" if @food_item.availability
    fill_in "Buyer", with: @food_item.buyer_id
    fill_in "Description", with: @food_item.description
    fill_in "Food type", with: @food_item.food_type
    fill_in "Name", with: @food_item.name
    fill_in "Price", with: @food_item.price
    fill_in "Profile", with: @food_item.profile_id
    fill_in "Seller", with: @food_item.seller_id
    click_on "Update Food item"

    assert_text "Food item was successfully updated"
    click_on "Back"
  end

  test "destroying a Food item" do
    visit food_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Food item was successfully destroyed"
  end
end
