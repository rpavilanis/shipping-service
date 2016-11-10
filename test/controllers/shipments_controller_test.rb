require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can get #index" do
    get :index
    assert_response :ok
  end

  test "#index returns json" do
    get :index
    assert_match 'application/json', response.header['Content-Type']
  end

  test "#index returns an Array of Pet objects" do
    get :index
    # Assign the result of the response from the controller action
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end

end
