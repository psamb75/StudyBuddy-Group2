require 'test_helper'

class StudyGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get study_group_index_url
    assert_response :success
  end

end
