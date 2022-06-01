require "test_helper"

class CrestronControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crestron_index_url
    assert_response :success
  end
end
