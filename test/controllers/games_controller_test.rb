require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_path
    assert_response :success
  end
end
