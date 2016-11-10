require 'test_helper'

class ShipmentsControllerTest < ActionController::TestCase

  test "can get #calculator" do
    get :calculator, {"country" => "US", "state" => "WA", "city" => "Seattle", "postal_code" => "98144", "weight" => "20"}
    assert_response :ok
  end

  test "#calculator returns json" do
    get :calculator, {"country" => "US", "state" => "WA", "city" => "Seattle", "postal_code" => "98144", "weight" => "20"}
    assert_match 'application/json', response.header['Content-Type']
  end

  test "#calculator returns an array of estimates" do
    get :calculator, {"country" => "US", "state" => "WA", "city" => "Seattle", "postal_code" => "98144", "weight" => "20"}
    # Assign the result of the response from the controller action
    body = JSON.parse(response.body)
    assert_instance_of Array, body
  end
end
