require 'test_helper'

class DashboardPlaceholderControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get dashboard_placeholder_hello_url
    assert_response :success
  end

end
