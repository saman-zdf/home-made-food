require 'test_helper'

class FoodItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_item = food_items(:one)
  end

  test "should get index" do
    get food_items_url
    assert_response :success
  end

  test "should get new" do
    get new_food_item_url
    assert_response :success
  end

  test "should create food_item" do
    assert_difference('FoodItem.count') do
      post food_items_url, params: { food_item: { availability: @food_item.availability, buyer_id: @food_item.buyer_id, description: @food_item.description, food_type: @food_item.food_type, name: @food_item.name, price: @food_item.price, profile_id: @food_item.profile_id, seller_id: @food_item.seller_id } }
    end

    assert_redirected_to food_item_url(FoodItem.last)
  end

  test "should show food_item" do
    get food_item_url(@food_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_item_url(@food_item)
    assert_response :success
  end

  test "should update food_item" do
    patch food_item_url(@food_item), params: { food_item: { availability: @food_item.availability, buyer_id: @food_item.buyer_id, description: @food_item.description, food_type: @food_item.food_type, name: @food_item.name, price: @food_item.price, profile_id: @food_item.profile_id, seller_id: @food_item.seller_id } }
    assert_redirected_to food_item_url(@food_item)
  end

  test "should destroy food_item" do
    assert_difference('FoodItem.count', -1) do
      delete food_item_url(@food_item)
    end

    assert_redirected_to food_items_url
  end
end
