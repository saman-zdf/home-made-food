require 'test_helper'

class PaymentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payment_index_url
    assert_response :success
  end

  test "should get create" do
    get payment_create_url
    assert_response :success
  end

end
